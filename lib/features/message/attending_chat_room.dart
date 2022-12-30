import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/attending_chat_room.dart';
import '../../models/message.dart';
import '../../repositories/firestore/app_user_repository.dart';
import '../../repositories/firestore/attending_chat_room.dart';
import '../../repositories/firestore/chat_room_repository.dart';
import '../../utils/exceptions/common.dart';
import '../auth/auth.dart';
import 'chat_room.dart';
import 'read_status.dart';

/// 指定した chatRoomId の messages サブコレクションの最新最大 1 件を購読する StreamProvider。
final _latestMessagesOfRoomProvider =
    StreamProvider.autoDispose.family<List<Message>, String>((ref, chatRoomId) {
  final userId = ref.watch(userIdProvider).value;
  if (userId == null) {
    throw const SignInRequiredException();
  }
  return ref.read(chatRoomRepositoryProvider).subscribeMessages(
        chatRoomId: chatRoomId,
        queryBuilder: (q) => q.orderBy('createdAt', descending: true).limit(1),
      );
});

/// 指定した chatRoomId の messages サブコレクションの最新最大 1 件を返す Provider。
final latestMessageOfRoomProvider =
    Provider.autoDispose.family<Message?, String>((ref, chatRoomId) {
  return ref.watch(_latestMessagesOfRoomProvider(chatRoomId)).when(
        data: (messages) => messages.isNotEmpty ? messages.first : null,
        error: (_, __) => null,
        loading: () => null,
      );
});

/// ユーザーの attendingChatRoom コレクションを購読する StreamProvider。
/// ユーザーがログインしていない場合は例外をスローする。
final attendingChatRoomsProvider =
    StreamProvider.autoDispose<List<AttendingChatRoom>>((ref) {
  final appUserId = ref.watch(userIdProvider).value;
  if (appUserId == null) {
    throw const SignInRequiredException();
  }
  final attendingChatRooms =
      ref.read(attendingChatRoomRepositoryProvider).subscribeAttendingChatRooms(
            appUserId: appUserId,
            queryBuilder: (q) => q.orderBy('updatedAt', descending: true),
          );
  return attendingChatRooms;
});

/// 指定した chatRoomId の messages サブコレクションに、message.createdAt が指定した DateTime より
/// 未来かつ送信者が相手である（自分ではない）ドキュメントの個数（最大 10 個）を購読する
/// StreamProvider。
final unreadCountProvider =
    StreamProvider.autoDispose.family<int, String>((ref, chatRoomId) {
  final userId = ref.watch(userIdProvider).value;
  if (userId == null) {
    return Stream.value(0);
  }
  final room = ref.watch(roomProvider(chatRoomId)).value;
  if (room == null) {
    return Stream.value(0);
  }
  final readStatus = ref.watch(readStatusProvider(chatRoomId)).value;
  final lastReadAt = readStatus?.lastReadAt.dateTime;
  return ref
      .read(chatRoomRepositoryProvider)
      .subscribeMessages(
        chatRoomId: room.chatRoomId,
        queryBuilder: (q) => lastReadAt != null
            ? q
                .where('createdAt', isGreaterThan: lastReadAt)
                .orderBy('createdAt', descending: true)
                .limit(10)
            : q.orderBy('createdAt', descending: true).limit(10),
      )
      .map(
        (messages) => messages
            .where((message) => message.senderId != userId)
            .toList()
            .length,
      );
});

final matchAttendingChatRoomProvider = StreamProvider.autoDispose
    .family<List<AttendingChatRoom>, String>((ref, partnerId) {
  final myId = ref.watch(userIdProvider).value;
  if (myId == null) {
    return Stream.value([]);
  }
  return ref
      .read(attendingChatRoomRepositoryProvider)
      .subscribeAttendingChatRooms(
        appUserId: myId,
        queryBuilder: (q) => q.where('partnerId', isEqualTo: partnerId),
      );
});

final attendeesNameProvider = FutureProvider.autoDispose.family<String, String>(
  (ref, chatRoomId) async {
    final chatRoom = await ref
        .read(chatRoomRepositoryProvider)
        .fetchChatRoom(chatRoomId: chatRoomId);

    if (chatRoom == null) {
      return '';
    }

    final appUserIds = chatRoom.appUserIds;
    final names = <String>[];
    for (final appUserId in appUserIds) {
      final user = await ref
          .read(appUserRepositoryProvider)
          .fetchAppUser(appUserId: appUserId);
      if (user == null) {
        continue;
      }
      names.add(user.name);
    }
    return names.join(', ');
  },
);
