import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/read_status.dart';
import '../../repositories/firestore/chat_room_repository.dart';
import '../../utils/exceptions/common.dart';
import '../auth/auth.dart';
import 'chat_room.dart';

/// 指定した chatRoomId の自身の readStatus ドキュメント：
/// rooms/{chatRoomId}/readStatus/{userId} を購読する StreamProvider。
final readStatusProvider =
    StreamProvider.autoDispose.family<ReadStatus?, String>((ref, chatRoomId) {
  final userId = ref.watch(userIdProvider).value;
  if (userId == null) {
    throw const SignInRequiredException();
  }
  return ref.read(chatRoomRepositoryProvider).subscribeReadStatus(
        chatRoomId: chatRoomId,
        readStatusId: userId,
        excludePendingWrites: true,
      );
});

/// 指定した chatRoomId の相手が最後にメッセージ読んだ時間を購読する StreamProvider。
final partnerReadStatusProvider =
    StreamProvider.autoDispose.family<ReadStatus?, String>((ref, chatRoomId) {
  final userId = ref.watch(userIdProvider).value;
  if (userId == null) {
    throw const SignInRequiredException();
  }
  final chatRoom = ref.watch(roomProvider(chatRoomId)).value;
  if (chatRoom == null) {
    throw Exception('指定したチャットルームが見つかりませんでした。');
  }
  final partnerId = chatRoom.appUserIds.firstWhere((id) => id != userId);
  return ref
      .read(chatRoomRepositoryProvider)
      .subscribeReadStatus(chatRoomId: chatRoomId, readStatusId: partnerId);
});
