import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/chat_room.dart';
import '../../models/message.dart';
import '../../models/read_status.dart';
import '../../utils/firestore_refs.dart';

final chatRoomRepositoryProvider =
    Provider.autoDispose<ChatRoomRepository>((_) => ChatRoomRepository());

class ChatRoomRepository {
  /// 指定した ChatRoom を取得する。
  Future<ChatRoom?> fetchChatRoom({
    required String chatRoomId,
    Source source = Source.serverAndCache,
  }) async {
    final ds = await chatRoomRef(chatRoomId: chatRoomId).get(GetOptions(source: source));
    return ds.data();
  }

  /// 指定した ChatRoom を購読する。
  Stream<ChatRoom?> subscribeChatRoom({
    required String chatRoomId,
  }) {
    final docStream = chatRoomRef(chatRoomId: chatRoomId).snapshots();
    return docStream.map((ds) => ds.data());
  }

  /// Message 一覧を取得する。
  Future<List<Message>> fetchMessages({
    required String chatRoomId,
    Source source = Source.serverAndCache,
    Query<Message>? Function(Query<Message> query)? queryBuilder,
    int Function(Message lhs, Message rhs)? compare,
  }) async {
    Query<Message> query = messagesRef(chatRoomId: chatRoomId);
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final qs = await query.get(GetOptions(source: source));
    final result = qs.docs.map((qds) => qds.data()).toList();
    if (compare != null) {
      result.sort(compare);
    }
    return result;
  }

  /// Message 一覧を購読する。
  Stream<List<Message>> subscribeMessages({
    required String chatRoomId,
    Query<Message>? Function(Query<Message> query)? queryBuilder,
    int Function(Message lhs, Message rhs)? compare,
  }) {
    Query<Message> query = messagesRef(chatRoomId: chatRoomId);
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    return query.snapshots().map((qs) {
      final result = qs.docs.map((qds) => qds.data()).toList();
      if (compare != null) {
        result.sort(compare);
      }
      return result;
    });
  }

  /// ReadStatus 一覧を購読する。
  Stream<List<ReadStatus>> subscribeReadStatuses({
    required String chatRoomId,
    Query<ReadStatus>? Function(Query<ReadStatus> query)? queryBuilder,
    int Function(ReadStatus lhs, ReadStatus rhs)? compare,
    bool excludePendingWrites = false,
  }) {
    Query<ReadStatus> query = readStatusesRef(chatRoomId: chatRoomId);
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    var collectionStream = query.snapshots();
    if (excludePendingWrites) {
      collectionStream = collectionStream.where((qs) => !qs.metadata.hasPendingWrites);
    }
    return collectionStream.map((qs) {
      final result = qs.docs.map((qds) => qds.data()).toList();
      if (compare != null) {
        result.sort(compare);
      }
      return result;
    });
  }

  /// 指定した ReadStatus を取得する。
  Future<ReadStatus?> fetchReadStatus({
    required String chatRoomId,
    required String readStatusId,
    Source source = Source.serverAndCache,
  }) async {
    final ds = await readStatusRef(chatRoomId: chatRoomId, readStatusId: readStatusId)
        .get(GetOptions(source: source));
    return ds.data();
  }

  /// 指定した ReadStatus を購読する。
  Stream<ReadStatus?> subscribeReadStatus({
    required String chatRoomId,
    required String readStatusId,
    bool excludePendingWrites = false,
  }) {
    var docStream = readStatusRef(chatRoomId: chatRoomId, readStatusId: readStatusId).snapshots();
    if (excludePendingWrites) {
      docStream = docStream.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return docStream.map((ds) {
      final data = ds.data();
      return data;
    });
  }
}
