// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirestorePosition _$$_FirestorePositionFromJson(Map<String, dynamic> json) =>
    _$_FirestorePosition(
      geohash: json['geohash'] as String? ?? '',
      geopoint: json['geopoint'] == null
          ? const GeoPoint(35.6812, 139.7671)
          : const GeoPointConverter().fromJson(json['geopoint'] as GeoPoint),
    );

Map<String, dynamic> _$$_FirestorePositionToJson(
        _$_FirestorePosition instance) =>
    <String, dynamic>{
      'geohash': instance.geohash,
      'geopoint': const GeoPointConverter().toJson(instance.geopoint),
    };
