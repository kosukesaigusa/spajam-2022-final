// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attending_chat_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AttendingChatRoom _$AttendingChatRoomFromJson(Map<String, dynamic> json) {
  return _AttendingChatRoom.fromJson(json);
}

/// @nodoc
mixin _$AttendingChatRoom {
  String get chatRoomId => throw _privateConstructorUsedError;
  String get partnerId => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt => throw _privateConstructorUsedError;
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendingChatRoomCopyWith<AttendingChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendingChatRoomCopyWith<$Res> {
  factory $AttendingChatRoomCopyWith(
          AttendingChatRoom value, $Res Function(AttendingChatRoom) then) =
      _$AttendingChatRoomCopyWithImpl<$Res, AttendingChatRoom>;
  @useResult
  $Res call(
      {String chatRoomId,
      String partnerId,
      bool isDeleted,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp createdAt,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp updatedAt});

  $UnionTimestampCopyWith<$Res> get createdAt;
  $UnionTimestampCopyWith<$Res> get updatedAt;
}

/// @nodoc
class _$AttendingChatRoomCopyWithImpl<$Res, $Val extends AttendingChatRoom>
    implements $AttendingChatRoomCopyWith<$Res> {
  _$AttendingChatRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomId = null,
    Object? partnerId = null,
    Object? isDeleted = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      chatRoomId: null == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      partnerId: null == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get updatedAt {
    return $UnionTimestampCopyWith<$Res>(_value.updatedAt, (value) {
      return _then(_value.copyWith(updatedAt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AttendingChatRoomCopyWith<$Res>
    implements $AttendingChatRoomCopyWith<$Res> {
  factory _$$_AttendingChatRoomCopyWith(_$_AttendingChatRoom value,
          $Res Function(_$_AttendingChatRoom) then) =
      __$$_AttendingChatRoomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String chatRoomId,
      String partnerId,
      bool isDeleted,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp createdAt,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp updatedAt});

  @override
  $UnionTimestampCopyWith<$Res> get createdAt;
  @override
  $UnionTimestampCopyWith<$Res> get updatedAt;
}

/// @nodoc
class __$$_AttendingChatRoomCopyWithImpl<$Res>
    extends _$AttendingChatRoomCopyWithImpl<$Res, _$_AttendingChatRoom>
    implements _$$_AttendingChatRoomCopyWith<$Res> {
  __$$_AttendingChatRoomCopyWithImpl(
      _$_AttendingChatRoom _value, $Res Function(_$_AttendingChatRoom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomId = null,
    Object? partnerId = null,
    Object? isDeleted = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_AttendingChatRoom(
      chatRoomId: null == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      partnerId: null == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AttendingChatRoom extends _AttendingChatRoom {
  const _$_AttendingChatRoom(
      {this.chatRoomId = '',
      this.partnerId = '',
      this.isDeleted = false,
      @alwaysUseServerTimestampUnionTimestampConverter
          this.createdAt = const UnionTimestamp.serverTimestamp(),
      @alwaysUseServerTimestampUnionTimestampConverter
          this.updatedAt = const UnionTimestamp.serverTimestamp()})
      : super._();

  factory _$_AttendingChatRoom.fromJson(Map<String, dynamic> json) =>
      _$$_AttendingChatRoomFromJson(json);

  @override
  @JsonKey()
  final String chatRoomId;
  @override
  @JsonKey()
  final String partnerId;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  @JsonKey()
  @alwaysUseServerTimestampUnionTimestampConverter
  final UnionTimestamp createdAt;
  @override
  @JsonKey()
  @alwaysUseServerTimestampUnionTimestampConverter
  final UnionTimestamp updatedAt;

  @override
  String toString() {
    return 'AttendingChatRoom(chatRoomId: $chatRoomId, partnerId: $partnerId, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AttendingChatRoom &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId) &&
            (identical(other.partnerId, partnerId) ||
                other.partnerId == partnerId) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, chatRoomId, partnerId, isDeleted, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AttendingChatRoomCopyWith<_$_AttendingChatRoom> get copyWith =>
      __$$_AttendingChatRoomCopyWithImpl<_$_AttendingChatRoom>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttendingChatRoomToJson(
      this,
    );
  }
}

abstract class _AttendingChatRoom extends AttendingChatRoom {
  const factory _AttendingChatRoom(
      {final String chatRoomId,
      final String partnerId,
      final bool isDeleted,
      @alwaysUseServerTimestampUnionTimestampConverter
          final UnionTimestamp createdAt,
      @alwaysUseServerTimestampUnionTimestampConverter
          final UnionTimestamp updatedAt}) = _$_AttendingChatRoom;
  const _AttendingChatRoom._() : super._();

  factory _AttendingChatRoom.fromJson(Map<String, dynamic> json) =
      _$_AttendingChatRoom.fromJson;

  @override
  String get chatRoomId;
  @override
  String get partnerId;
  @override
  bool get isDeleted;
  @override
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt;
  @override
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_AttendingChatRoomCopyWith<_$_AttendingChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}
