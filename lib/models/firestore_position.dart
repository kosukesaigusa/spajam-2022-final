import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/json_converters/geo_point_converter.dart';

part 'firestore_position.freezed.dart';
part 'firestore_position.g.dart';

@freezed
class FirestorePosition with _$FirestorePosition {
  const factory FirestorePosition({
    @Default('') String geohash,
    @Default(GeoPoint(35.6812, 139.7671)) @GeoPointConverter() GeoPoint geopoint,
  }) = _FirestorePosition;

  factory FirestorePosition.fromJson(Map<String, dynamic> json) =>
      _$FirestorePositionFromJson(json);

  factory FirestorePosition.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return FirestorePosition.fromJson(<String, dynamic>{
      ...data,
    });
  }

  static const defaultValue = FirestorePosition();
}

class FirestorePositionConverter implements JsonConverter<FirestorePosition, Map<String, dynamic>> {
  const FirestorePositionConverter();

  @override
  FirestorePosition fromJson(Map<String, dynamic> positionMap) {
    final geohash = (positionMap['geohash'] ?? '') as String;
    final geopoint = positionMap['geopoint'] as GeoPoint;
    return FirestorePosition(geohash: geohash, geopoint: geopoint);
  }

  @override
  Map<String, dynamic> toJson(FirestorePosition position) {
    final geohash = position.geohash;
    final geopoint = position.geopoint;
    return <String, dynamic>{
      'geohash': geohash,
      'geopoint': geopoint,
    };
  }
}
