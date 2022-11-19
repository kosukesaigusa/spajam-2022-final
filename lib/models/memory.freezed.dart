// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'memory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Memory _$MemoryFromJson(Map<String, dynamic> json) {
  return _Memory.fromJson(json);
}

/// @nodoc
mixin _$Memory {
  String get memoryId => throw _privateConstructorUsedError;
  String get appUserId => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemoryCopyWith<Memory> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoryCopyWith<$Res> {
  factory $MemoryCopyWith(Memory value, $Res Function(Memory) then) =
      _$MemoryCopyWithImpl<$Res, Memory>;
  @useResult
  $Res call(
      {String memoryId,
      String appUserId,
      String imageUrl,
      String comment,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp createdAt});

  $UnionTimestampCopyWith<$Res> get createdAt;
}

/// @nodoc
class _$MemoryCopyWithImpl<$Res, $Val extends Memory>
    implements $MemoryCopyWith<$Res> {
  _$MemoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memoryId = null,
    Object? appUserId = null,
    Object? imageUrl = null,
    Object? comment = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      memoryId: null == memoryId
          ? _value.memoryId
          : memoryId // ignore: cast_nullable_to_non_nullable
              as String,
      appUserId: null == appUserId
          ? _value.appUserId
          : appUserId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get createdAt {
    return $UnionTimestampCopyWith<$Res>(_value.createdAt, (value) {
      return _then(_value.copyWith(createdAt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MemoryCopyWith<$Res> implements $MemoryCopyWith<$Res> {
  factory _$$_MemoryCopyWith(_$_Memory value, $Res Function(_$_Memory) then) =
      __$$_MemoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String memoryId,
      String appUserId,
      String imageUrl,
      String comment,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp createdAt});

  @override
  $UnionTimestampCopyWith<$Res> get createdAt;
}

/// @nodoc
class __$$_MemoryCopyWithImpl<$Res>
    extends _$MemoryCopyWithImpl<$Res, _$_Memory>
    implements _$$_MemoryCopyWith<$Res> {
  __$$_MemoryCopyWithImpl(_$_Memory _value, $Res Function(_$_Memory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memoryId = null,
    Object? appUserId = null,
    Object? imageUrl = null,
    Object? comment = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Memory(
      memoryId: null == memoryId
          ? _value.memoryId
          : memoryId // ignore: cast_nullable_to_non_nullable
              as String,
      appUserId: null == appUserId
          ? _value.appUserId
          : appUserId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Memory extends _Memory {
  _$_Memory(
      {required this.memoryId,
      required this.appUserId,
      required this.imageUrl,
      this.comment = '',
      @alwaysUseServerTimestampUnionTimestampConverter
          this.createdAt = const UnionTimestamp.serverTimestamp()})
      : super._();

  factory _$_Memory.fromJson(Map<String, dynamic> json) =>
      _$$_MemoryFromJson(json);

  @override
  final String memoryId;
  @override
  final String appUserId;
  @override
  final String imageUrl;
  @override
  @JsonKey()
  final String comment;
  @override
  @JsonKey()
  @alwaysUseServerTimestampUnionTimestampConverter
  final UnionTimestamp createdAt;

  @override
  String toString() {
    return 'Memory(memoryId: $memoryId, appUserId: $appUserId, imageUrl: $imageUrl, comment: $comment, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Memory &&
            (identical(other.memoryId, memoryId) ||
                other.memoryId == memoryId) &&
            (identical(other.appUserId, appUserId) ||
                other.appUserId == appUserId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, memoryId, appUserId, imageUrl, comment, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemoryCopyWith<_$_Memory> get copyWith =>
      __$$_MemoryCopyWithImpl<_$_Memory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemoryToJson(
      this,
    );
  }
}

abstract class _Memory extends Memory {
  factory _Memory(
      {required final String memoryId,
      required final String appUserId,
      required final String imageUrl,
      final String comment,
      @alwaysUseServerTimestampUnionTimestampConverter
          final UnionTimestamp createdAt}) = _$_Memory;
  _Memory._() : super._();

  factory _Memory.fromJson(Map<String, dynamic> json) = _$_Memory.fromJson;

  @override
  String get memoryId;
  @override
  String get appUserId;
  @override
  String get imageUrl;
  @override
  String get comment;
  @override
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_MemoryCopyWith<_$_Memory> get copyWith =>
      throw _privateConstructorUsedError;
}
