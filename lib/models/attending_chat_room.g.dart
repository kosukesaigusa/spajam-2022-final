// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attending_chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AttendingChatRoom _$$_AttendingChatRoomFromJson(Map<String, dynamic> json) =>
    _$_AttendingChatRoom(
      attendingChatRoomId: json['attendingChatRoomId'] as String? ?? '',
      partnerId: json['partnerId'] as String? ?? '',
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['createdAt'] as Object),
      updatedAt: json['updatedAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['updatedAt'] as Object),
    );

Map<String, dynamic> _$$_AttendingChatRoomToJson(
        _$_AttendingChatRoom instance) =>
    <String, dynamic>{
      'attendingChatRoomId': instance.attendingChatRoomId,
      'partnerId': instance.partnerId,
      'isDeleted': instance.isDeleted,
      'createdAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.createdAt),
      'updatedAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.updatedAt),
    };
