// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      name: json['name'] as String? ?? '',
      appUserId: json['appUserId'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      country: json['country'] as String? ?? '',
      isVisible: json['isVisible'] as bool? ?? true,
      flags:
          (json['flags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
      comment: json['comment'] as String? ?? '',
      location: json['location'] == null
          ? FirestorePosition.defaultValue
          : const FirestorePositionConverter()
              .fromJson(json['location'] as Map<String, dynamic>),
      fcmTokens: (json['fcmTokens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'appUserId': instance.appUserId,
      'imageUrl': instance.imageUrl,
      'country': instance.country,
      'isVisible': instance.isVisible,
      'flags': instance.flags,
      'comment': instance.comment,
      'location': const FirestorePositionConverter().toJson(instance.location),
      'fcmTokens': instance.fcmTokens,
    };
