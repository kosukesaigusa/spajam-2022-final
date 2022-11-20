import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/attending_chat_room.dart';
import '../../utils/firestore_refs.dart';
import '../../utils/logger.dart';

final attendingChatRoomRepositoryProvider =
    Provider.autoDispose<AttendingChatRoomRepository>((_) => AttendingChatRoomRepository());

class AttendingChatRoomRepository {
  /// 指定した AttendingChatRoom を取得する。
  Future<AttendingChatRoom?> fetchAttendingChatRoom({
    required String appUserId,
    required String chatRoomId,
  }) async {
    final ds = await attendingChatRoomRef(appUserId: appUserId, chatRoomId: chatRoomId).get();
    if (!ds.exists) {
      logger.warning('Document not found: ${ds.reference.path}');
      return null;
    }
    return ds.data();
  }

  /// AttendingChatRoom 一覧を購読する。
  Stream<List<AttendingChatRoom>> subscribeAttendingChatRooms({
    required String appUserId,
    Query<AttendingChatRoom>? Function(Query<AttendingChatRoom> query)? queryBuilder,
    int Function(AttendingChatRoom lhs, AttendingChatRoom rhs)? compare,
  }) {
    Query<AttendingChatRoom> query = attendingChatRoomsRef(appUserId: appUserId);
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
}
