// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_notification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TestNotificationRequest _$$_TestNotificationRequestFromJson(
        Map<String, dynamic> json) =>
    _$_TestNotificationRequest(
      token: json['token'] as String? ?? '',
      testNotificationRequest: json['testNotificationRequest'] as String? ?? '',
      testNotificationRequestType: $enumDecodeNullable(
              _$TestNotificationRequestTypeEnumMap,
              json['testNotificationRequestType']) ??
          TestNotificationRequestType.normal,
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : unionTimestampConverter.fromJson(json['createdAt'] as Object),
    );

Map<String, dynamic> _$$_TestNotificationRequestToJson(
        _$_TestNotificationRequest instance) =>
    <String, dynamic>{
      'token': instance.token,
      'testNotificationRequest': instance.testNotificationRequest,
      'testNotificationRequestType': _$TestNotificationRequestTypeEnumMap[
          instance.testNotificationRequestType]!,
      'createdAt': unionTimestampConverter.toJson(instance.createdAt),
    };

const _$TestNotificationRequestTypeEnumMap = {
  TestNotificationRequestType.normal: 'normal',
  TestNotificationRequestType.github: 'github',
};
