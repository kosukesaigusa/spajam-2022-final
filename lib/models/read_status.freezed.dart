// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'read_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReadStatus _$ReadStatusFromJson(Map<String, dynamic> json) {
  return _ReadStatus.fromJson(json);
}

/// @nodoc
mixin _$ReadStatus {
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get lastReadAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadStatusCopyWith<ReadStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadStatusCopyWith<$Res> {
  factory $ReadStatusCopyWith(
          ReadStatus value, $Res Function(ReadStatus) then) =
      _$ReadStatusCopyWithImpl<$Res, ReadStatus>;
  @useResult
  $Res call(
      {@alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp lastReadAt});

  $UnionTimestampCopyWith<$Res> get lastReadAt;
}

/// @nodoc
class _$ReadStatusCopyWithImpl<$Res, $Val extends ReadStatus>
    implements $ReadStatusCopyWith<$Res> {
  _$ReadStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastReadAt = null,
  }) {
    return _then(_value.copyWith(
      lastReadAt: null == lastReadAt
          ? _value.lastReadAt
          : lastReadAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get lastReadAt {
    return $UnionTimestampCopyWith<$Res>(_value.lastReadAt, (value) {
      return _then(_value.copyWith(lastReadAt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReadStatusCopyWith<$Res>
    implements $ReadStatusCopyWith<$Res> {
  factory _$$_ReadStatusCopyWith(
          _$_ReadStatus value, $Res Function(_$_ReadStatus) then) =
      __$$_ReadStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp lastReadAt});

  @override
  $UnionTimestampCopyWith<$Res> get lastReadAt;
}

/// @nodoc
class __$$_ReadStatusCopyWithImpl<$Res>
    extends _$ReadStatusCopyWithImpl<$Res, _$_ReadStatus>
    implements _$$_ReadStatusCopyWith<$Res> {
  __$$_ReadStatusCopyWithImpl(
      _$_ReadStatus _value, $Res Function(_$_ReadStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastReadAt = null,
  }) {
    return _then(_$_ReadStatus(
      lastReadAt: null == lastReadAt
          ? _value.lastReadAt
          : lastReadAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReadStatus implements _ReadStatus {
  const _$_ReadStatus(
      {@alwaysUseServerTimestampUnionTimestampConverter
          this.lastReadAt = const UnionTimestamp.serverTimestamp()});

  factory _$_ReadStatus.fromJson(Map<String, dynamic> json) =>
      _$$_ReadStatusFromJson(json);

  @override
  @JsonKey()
  @alwaysUseServerTimestampUnionTimestampConverter
  final UnionTimestamp lastReadAt;

  @override
  String toString() {
    return 'ReadStatus(lastReadAt: $lastReadAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReadStatus &&
            (identical(other.lastReadAt, lastReadAt) ||
                other.lastReadAt == lastReadAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lastReadAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReadStatusCopyWith<_$_ReadStatus> get copyWith =>
      __$$_ReadStatusCopyWithImpl<_$_ReadStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReadStatusToJson(
      this,
    );
  }
}

abstract class _ReadStatus implements ReadStatus {
  const factory _ReadStatus(
      {@alwaysUseServerTimestampUnionTimestampConverter
          final UnionTimestamp lastReadAt}) = _$_ReadStatus;

  factory _ReadStatus.fromJson(Map<String, dynamic> json) =
      _$_ReadStatus.fromJson;

  @override
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get lastReadAt;
  @override
  @JsonKey(ignore: true)
  _$$_ReadStatusCopyWith<_$_ReadStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
