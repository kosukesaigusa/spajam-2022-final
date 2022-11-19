import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/json_converters/union_timestamp.dart';

part 'attending_chat_room.freezed.dart';
part 'attending_chat_room.g.dart';

@freezed
class AttendingChatRoom with _$AttendingChatRoom {
  const factory AttendingChatRoom({
    @Default('') String chatRoomId,
    @Default('') String partnerId,
    @Default(false) bool isDeleted,
    @alwaysUseServerTimestampUnionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
        UnionTimestamp createdAt,
    @alwaysUseServerTimestampUnionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
        UnionTimestamp updatedAt,
  }) = _AttendingChatRoom;

  factory AttendingChatRoom.fromJson(Map<String, dynamic> json) => _$AttendingChatRoomFromJson(json);

  factory AttendingChatRoom.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return AttendingChatRoom.fromJson(<String, dynamic>{
      ...data,
      'chatRoomId': ds.id,
    });
  }

  const AttendingChatRoom._();
}
