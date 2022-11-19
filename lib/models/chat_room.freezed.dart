// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) {
  return _ChatRoom.fromJson(json);
}

/// @nodoc
mixin _$ChatRoom {
  String get chatRoomId => throw _privateConstructorUsedError;
  List<String> get appUserIds => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomCopyWith<ChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomCopyWith<$Res> {
  factory $ChatRoomCopyWith(ChatRoom value, $Res Function(ChatRoom) then) =
      _$ChatRoomCopyWithImpl<$Res, ChatRoom>;
  @useResult
  $Res call(
      {String chatRoomId,
      List<String> appUserIds,
      bool isDeleted,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp createdAt});

  $UnionTimestampCopyWith<$Res> get createdAt;
}

/// @nodoc
class _$ChatRoomCopyWithImpl<$Res, $Val extends ChatRoom>
    implements $ChatRoomCopyWith<$Res> {
  _$ChatRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomId = null,
    Object? appUserIds = null,
    Object? isDeleted = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      chatRoomId: null == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      appUserIds: null == appUserIds
          ? _value.appUserIds
          : appUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$_ChatRoomCopyWith<$Res> implements $ChatRoomCopyWith<$Res> {
  factory _$$_ChatRoomCopyWith(
          _$_ChatRoom value, $Res Function(_$_ChatRoom) then) =
      __$$_ChatRoomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String chatRoomId,
      List<String> appUserIds,
      bool isDeleted,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp createdAt});

  @override
  $UnionTimestampCopyWith<$Res> get createdAt;
}

/// @nodoc
class __$$_ChatRoomCopyWithImpl<$Res>
    extends _$ChatRoomCopyWithImpl<$Res, _$_ChatRoom>
    implements _$$_ChatRoomCopyWith<$Res> {
  __$$_ChatRoomCopyWithImpl(
      _$_ChatRoom _value, $Res Function(_$_ChatRoom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomId = null,
    Object? appUserIds = null,
    Object? isDeleted = null,
    Object? createdAt = null,
  }) {
    return _then(_$_ChatRoom(
      chatRoomId: null == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      appUserIds: null == appUserIds
          ? _value._appUserIds
          : appUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatRoom implements _ChatRoom {
  const _$_ChatRoom(
      {this.chatRoomId = '',
      final List<String> appUserIds = const <String>[],
      this.isDeleted = false,
      @alwaysUseServerTimestampUnionTimestampConverter
          this.createdAt = const UnionTimestamp.serverTimestamp()})
      : _appUserIds = appUserIds;

  factory _$_ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$$_ChatRoomFromJson(json);

  @override
  @JsonKey()
  final String chatRoomId;
  final List<String> _appUserIds;
  @override
  @JsonKey()
  List<String> get appUserIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appUserIds);
  }

  @override
  @JsonKey()
  final bool isDeleted;
  @override
  @JsonKey()
  @alwaysUseServerTimestampUnionTimestampConverter
  final UnionTimestamp createdAt;

  @override
  String toString() {
    return 'ChatRoom(chatRoomId: $chatRoomId, appUserIds: $appUserIds, isDeleted: $isDeleted, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatRoom &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId) &&
            const DeepCollectionEquality()
                .equals(other._appUserIds, _appUserIds) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chatRoomId,
      const DeepCollectionEquality().hash(_appUserIds), isDeleted, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatRoomCopyWith<_$_ChatRoom> get copyWith =>
      __$$_ChatRoomCopyWithImpl<_$_ChatRoom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatRoomToJson(
      this,
    );
  }
}

abstract class _ChatRoom implements ChatRoom {
  const factory _ChatRoom(
      {final String chatRoomId,
      final List<String> appUserIds,
      final bool isDeleted,
      @alwaysUseServerTimestampUnionTimestampConverter
          final UnionTimestamp createdAt}) = _$_ChatRoom;

  factory _ChatRoom.fromJson(Map<String, dynamic> json) = _$_ChatRoom.fromJson;

  @override
  String get chatRoomId;
  @override
  List<String> get appUserIds;
  @override
  bool get isDeleted;
  @override
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_ChatRoomCopyWith<_$_ChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}
