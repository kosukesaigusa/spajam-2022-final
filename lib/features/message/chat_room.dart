import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/chat_room.dart';
import '../../models/message.dart';
import '../../repositories/firestore/chat_room_repository.dart';
import '../../utils/exceptions/common.dart';
import '../../utils/firestore_refs.dart';
import '../../utils/scaffold_messenger_service.dart';
import '../../utils/uuid.dart';
import '../auth/auth.dart';
import 'chat_room_page_state.dart';

const messageLimit = 10;
const scrollValueThreshold = 0.8;

/// 指定した chatRoomId の ChatRoom ドキュメントを購読する StreamProvider。
final roomProvider = StreamProvider.autoDispose.family<ChatRoom?, String>((ref, chatRoomId) {
  return ref.read(chatRoomRepositoryProvider).subscribeChatRoom(chatRoomId: chatRoomId);
});

/// ルームページのメッセージを読み書きする状態管理・操作をグループ化した StateNotifierProvider。
final roomPageStateNotifierProvider = StateNotifierProvider.autoDispose
    .family<ChatRoomPageStateNotifierProvider, ChatRoomPageState, String>(
  (ref, chatRoomId) {
    final userId = ref.watch(userIdProvider).value;
    if (userId == null) {
      throw const SignInRequiredException();
    }
    return ChatRoomPageStateNotifierProvider(ref, chatRoomId)..initialize();
  },
);

/// ChatRoomPage の状態を管理・操作する StateNotifierProvider
class ChatRoomPageStateNotifierProvider extends StateNotifier<ChatRoomPageState> {
  ChatRoomPageStateNotifierProvider(this._ref, this._chatRoomId) : super(const ChatRoomPageState());

  final AutoDisposeStateNotifierProviderRef<ChatRoomPageStateNotifierProvider, ChatRoomPageState>
      _ref;
  final String _chatRoomId;
  late StreamSubscription<List<Message>> _newMessagesSubscription;
  late TextEditingController textEditingController;
  late ScrollController scrollController;

  @override
  void dispose() {
    Future<void>(() async {
      super.dispose();
      // await _setDraftMessageFromSharedPreferences();
      await _newMessagesSubscription.cancel();
      textEditingController.dispose();
      scrollController.dispose();
    });
  }

  /// 初期化処理。
  /// コンストラクタメソッドと一緒にコールする。
  Future<void> initialize() async {
    _initializeScrollController();
    _initializeNewMessagesSubscription();
    await Future.wait<void>([
      _initializeTextEditingController(),
      loadMore(),
      Future<void>.delayed(const Duration(milliseconds: 500)),
    ]);
    state = state.copyWith(loading: false);
  }

  /// 読み取り開始時刻以降のメッセージを購読して
  /// 画面に表示する messages に反映させるリスナーを初期化する。
  void _initializeNewMessagesSubscription() {
    _newMessagesSubscription = _ref
        .read(chatRoomRepositoryProvider)
        .subscribeMessages(
          chatRoomId: _chatRoomId,
          queryBuilder: (q) => q
              .orderBy('createdAt', descending: true)
              .where('createdAt', isGreaterThanOrEqualTo: DateTime.now()),
        )
        .listen((messages) async {
      state = state.copyWith(newMessages: messages);
      _updateMessages();
      // ルームを開いている間にメッセージが届いた場合は
      // すぐに既読になるように lastReadAt も更新する。
      // final userId = _ref.read(userIdProvider).value;
      // if (userId != null) {
      //   await _ref
      //       .read(chatRoomRepositoryProvider)
      //       .readStatusRef(
      //         chatRoomId: _chatRoomId,
      //         readStatusId: userId,
      //       )
      //       .set(const ReadStatus(), SetOptions(merge: true));
      // }
    });
  }

  /// TextEditingController を初期化してリスナーを設定する
  Future<void> _initializeTextEditingController() async {
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      final text = textEditingController.text;
      state = state.copyWith(isValid: text.isNotEmpty);
    });
    // 以前の下書きが残っていれば予め入力しておく
    // ..text = await _getDraftMessageFromSharedPreferences();
    // textEditingController
    //   ..addListener(() {
    //     final text = textEditingController.text;
    //     state = state.copyWith(isValid: text.isNotEmpty);
    //   })
    //   // 以前の下書きが残っていれば予め入力しておく
    //   ..text = await _getDraftMessageFromSharedPreferences();
  }

  /// ListView の ScrollController を初期化して、
  /// 過去のメッセージを遡って取得するための Listener を設定する。
  void _initializeScrollController() {
    scrollController = ScrollController();
    scrollController.addListener(() async {
      final scrollValue = scrollController.offset / scrollController.position.maxScrollExtent;
      if (scrollValue > scrollValueThreshold) {
        await loadMore();
      }
    });
  }

  // /// SharedPreferences に chatRoomId をキーとした下書きが存在すれば取得する
  // Future<String> _getDraftMessageFromSharedPreferences() async {
  //   return _ref.read(sharedPreferencesServiceProvider).getDraftMessage(chatRoomId: _chatRoomId);
  // }

  // /// SharedPreferences に chatRoomId をキーとした下書きを保存する
  // Future<void> _setDraftMessageFromSharedPreferences() async {
  //   await _ref.read(sharedPreferencesServiceProvider).setDraftMessage(
  //         chatRoomId: _chatRoomId,
  //         message: textEditingController.value.text,
  //       );
  // }

  /// 無限スクロールのクエリ
  Query<Message> get _query {
    var query = messagesRef(chatRoomId: _chatRoomId).orderBy('createdAt', descending: true);
    final qds = state.lastVisibleQds;
    if (qds != null) {
      query = query.startAfterDocument(qds);
    }
    return query.limit(messageLimit);
  }

  /// 表示するメッセージを更新する
  void _updateMessages() {
    state = state.copyWith(messages: [...state.newMessages, ...state.pastMessages]);
  }

  /// メッセージを送信する
  Future<void> send() async {
    if (state.sending) {
      return;
    }
    final userId = _ref.read(userIdProvider).value;
    if (userId == null) {
      _ref.read(scaffoldMessengerServiceProvider).showSnackBar('一度サインインしてから再度お試しください。');
      return;
    }
    state = state.copyWith(sending: true);
    final text = textEditingController.value.text;
    if (text.isEmpty) {
      _ref.read(scaffoldMessengerServiceProvider).showSnackBar('内容を入力してください。');
      return;
    }
    final message = Message(
      messageId: uuid,
      senderId: userId,
      message: text,
    );
    try {
      await messageRef(
        chatRoomId: _chatRoomId,
        messageId: message.messageId,
      ).set(message);
    } on FirebaseException catch (e) {
      _ref.read(scaffoldMessengerServiceProvider).showSnackBarByFirebaseException(e);
    } finally {
      state = state.copyWith(sending: false);
      textEditingController.clear();
      await scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );
      // await _ref.read(sharedPreferencesServiceProvider).removeDraftByChatRoomId(_chatRoomId);
    }
  }

  /// 過去のメッセージを、最後に取得した queryDocumentSnapshot 以降の
  /// limit 件だけ取得する。
  Future<void> loadMore() async {
    if (!state.hasMore) {
      state = state.copyWith(fetching: false);
      return;
    }
    if (state.fetching) {
      return;
    }
    state = state.copyWith(fetching: true);
    final qs = await _query.limit(messageLimit).get();
    final messages = qs.docs.map((qds) => qds.data()).toList();
    state = state.copyWith(pastMessages: [...state.pastMessages, ...messages]);
    _updateMessages();
    state = state.copyWith(
      fetching: false,
      lastVisibleQds: qs.docs.isNotEmpty ? qs.docs.last : null,
      hasMore: qs.docs.length >= messageLimit,
    );
  }
}
