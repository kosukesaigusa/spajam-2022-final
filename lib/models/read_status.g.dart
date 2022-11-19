// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReadStatus _$$_ReadStatusFromJson(Map<String, dynamic> json) =>
    _$_ReadStatus(
      lastReadAt: json['lastReadAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['lastReadAt'] as Object),
    );

Map<String, dynamic> _$$_ReadStatusToJson(_$_ReadStatus instance) =>
    <String, dynamic>{
      'lastReadAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.lastReadAt),
    };
