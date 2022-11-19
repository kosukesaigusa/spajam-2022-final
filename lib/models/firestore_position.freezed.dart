// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'firestore_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FirestorePosition _$FirestorePositionFromJson(Map<String, dynamic> json) {
  return _FirestorePosition.fromJson(json);
}

/// @nodoc
mixin _$FirestorePosition {
  String get geohash => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoPoint get geopoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirestorePositionCopyWith<FirestorePosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirestorePositionCopyWith<$Res> {
  factory $FirestorePositionCopyWith(
          FirestorePosition value, $Res Function(FirestorePosition) then) =
      _$FirestorePositionCopyWithImpl<$Res, FirestorePosition>;
  @useResult
  $Res call({String geohash, @GeoPointConverter() GeoPoint geopoint});
}

/// @nodoc
class _$FirestorePositionCopyWithImpl<$Res, $Val extends FirestorePosition>
    implements $FirestorePositionCopyWith<$Res> {
  _$FirestorePositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geohash = null,
    Object? geopoint = null,
  }) {
    return _then(_value.copyWith(
      geohash: null == geohash
          ? _value.geohash
          : geohash // ignore: cast_nullable_to_non_nullable
              as String,
      geopoint: null == geopoint
          ? _value.geopoint
          : geopoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FirestorePositionCopyWith<$Res>
    implements $FirestorePositionCopyWith<$Res> {
  factory _$$_FirestorePositionCopyWith(_$_FirestorePosition value,
          $Res Function(_$_FirestorePosition) then) =
      __$$_FirestorePositionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String geohash, @GeoPointConverter() GeoPoint geopoint});
}

/// @nodoc
class __$$_FirestorePositionCopyWithImpl<$Res>
    extends _$FirestorePositionCopyWithImpl<$Res, _$_FirestorePosition>
    implements _$$_FirestorePositionCopyWith<$Res> {
  __$$_FirestorePositionCopyWithImpl(
      _$_FirestorePosition _value, $Res Function(_$_FirestorePosition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geohash = null,
    Object? geopoint = null,
  }) {
    return _then(_$_FirestorePosition(
      geohash: null == geohash
          ? _value.geohash
          : geohash // ignore: cast_nullable_to_non_nullable
              as String,
      geopoint: null == geopoint
          ? _value.geopoint
          : geopoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirestorePosition implements _FirestorePosition {
  const _$_FirestorePosition(
      {this.geohash = '',
      @GeoPointConverter() this.geopoint = const GeoPoint(35.6812, 139.7671)});

  factory _$_FirestorePosition.fromJson(Map<String, dynamic> json) =>
      _$$_FirestorePositionFromJson(json);

  @override
  @JsonKey()
  final String geohash;
  @override
  @JsonKey()
  @GeoPointConverter()
  final GeoPoint geopoint;

  @override
  String toString() {
    return 'FirestorePosition(geohash: $geohash, geopoint: $geopoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FirestorePosition &&
            (identical(other.geohash, geohash) || other.geohash == geohash) &&
            (identical(other.geopoint, geopoint) ||
                other.geopoint == geopoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, geohash, geopoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FirestorePositionCopyWith<_$_FirestorePosition> get copyWith =>
      __$$_FirestorePositionCopyWithImpl<_$_FirestorePosition>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirestorePositionToJson(
      this,
    );
  }
}

abstract class _FirestorePosition implements FirestorePosition {
  const factory _FirestorePosition(
      {final String geohash,
      @GeoPointConverter() final GeoPoint geopoint}) = _$_FirestorePosition;

  factory _FirestorePosition.fromJson(Map<String, dynamic> json) =
      _$_FirestorePosition.fromJson;

  @override
  String get geohash;
  @override
  @GeoPointConverter()
  GeoPoint get geopoint;
  @override
  @JsonKey(ignore: true)
  _$$_FirestorePositionCopyWith<_$_FirestorePosition> get copyWith =>
      throw _privateConstructorUsedError;
}
