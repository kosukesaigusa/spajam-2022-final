// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Memory _$$_MemoryFromJson(Map<String, dynamic> json) => _$_Memory(
      memoryId: json['memoryId'] as String,
      partnerId: json['partnerId'] as String,
      imageUrl: json['imageUrl'] as String,
      comment: json['comment'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : unionTimestampConverter.fromJson(json['createdAt'] as Object),
    );

Map<String, dynamic> _$$_MemoryToJson(_$_Memory instance) => <String, dynamic>{
      'memoryId': instance.memoryId,
      'partnerId': instance.partnerId,
      'imageUrl': instance.imageUrl,
      'comment': instance.comment,
      'createdAt': unionTimestampConverter.toJson(instance.createdAt),
    };
