// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String get name => throw _privateConstructorUsedError;
  String get appUserId => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  @CountryConverter()
  Country get country => throw _privateConstructorUsedError;

  /// マップ上に表示されるかどうか
  bool get isVisible => throw _privateConstructorUsedError;

  /// 交流した人の国旗
  @FlagsConverter()
  List<Country> get flags => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  @FirestorePositionConverter()
  FirestorePosition get location => throw _privateConstructorUsedError;
  List<String> get fcmTokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String name,
      String appUserId,
      String imageUrl,
      @CountryConverter() Country country,
      bool isVisible,
      @FlagsConverter() List<Country> flags,
      String comment,
      @FirestorePositionConverter() FirestorePosition location,
      List<String> fcmTokens});

  $FirestorePositionCopyWith<$Res> get location;
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? appUserId = null,
    Object? imageUrl = null,
    Object? country = null,
    Object? isVisible = null,
    Object? flags = null,
    Object? comment = null,
    Object? location = null,
    Object? fcmTokens = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      appUserId: null == appUserId
          ? _value.appUserId
          : appUserId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      flags: null == flags
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as List<Country>,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as FirestorePosition,
      fcmTokens: null == fcmTokens
          ? _value.fcmTokens
          : fcmTokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FirestorePositionCopyWith<$Res> get location {
    return $FirestorePositionCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$_AppUserCopyWith(
          _$_AppUser value, $Res Function(_$_AppUser) then) =
      __$$_AppUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String appUserId,
      String imageUrl,
      @CountryConverter() Country country,
      bool isVisible,
      @FlagsConverter() List<Country> flags,
      String comment,
      @FirestorePositionConverter() FirestorePosition location,
      List<String> fcmTokens});

  @override
  $FirestorePositionCopyWith<$Res> get location;
}

/// @nodoc
class __$$_AppUserCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$_AppUser>
    implements _$$_AppUserCopyWith<$Res> {
  __$$_AppUserCopyWithImpl(_$_AppUser _value, $Res Function(_$_AppUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? appUserId = null,
    Object? imageUrl = null,
    Object? country = null,
    Object? isVisible = null,
    Object? flags = null,
    Object? comment = null,
    Object? location = null,
    Object? fcmTokens = null,
  }) {
    return _then(_$_AppUser(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      appUserId: null == appUserId
          ? _value.appUserId
          : appUserId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      flags: null == flags
          ? _value._flags
          : flags // ignore: cast_nullable_to_non_nullable
              as List<Country>,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as FirestorePosition,
      fcmTokens: null == fcmTokens
          ? _value._fcmTokens
          : fcmTokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUser extends _AppUser {
  const _$_AppUser(
      {this.name = '',
      this.appUserId = '',
      this.imageUrl = '',
      @CountryConverter()
          this.country = Country.unknown,
      this.isVisible = true,
      @FlagsConverter()
          final List<Country> flags = const <Country>[],
      this.comment = '',
      @FirestorePositionConverter()
          this.location = FirestorePosition.defaultValue,
      final List<String> fcmTokens = const <String>[]})
      : _flags = flags,
        _fcmTokens = fcmTokens,
        super._();

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String appUserId;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  @CountryConverter()
  final Country country;

  /// マップ上に表示されるかどうか
  @override
  @JsonKey()
  final bool isVisible;

  /// 交流した人の国旗
  final List<Country> _flags;

  /// 交流した人の国旗
  @override
  @JsonKey()
  @FlagsConverter()
  List<Country> get flags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flags);
  }

  @override
  @JsonKey()
  final String comment;
  @override
  @JsonKey()
  @FirestorePositionConverter()
  final FirestorePosition location;
  final List<String> _fcmTokens;
  @override
  @JsonKey()
  List<String> get fcmTokens {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fcmTokens);
  }

  @override
  String toString() {
    return 'AppUser(name: $name, appUserId: $appUserId, imageUrl: $imageUrl, country: $country, isVisible: $isVisible, flags: $flags, comment: $comment, location: $location, fcmTokens: $fcmTokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUser &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.appUserId, appUserId) ||
                other.appUserId == appUserId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            const DeepCollectionEquality().equals(other._flags, _flags) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other._fcmTokens, _fcmTokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      appUserId,
      imageUrl,
      country,
      isVisible,
      const DeepCollectionEquality().hash(_flags),
      comment,
      location,
      const DeepCollectionEquality().hash(_fcmTokens));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      __$$_AppUserCopyWithImpl<_$_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserToJson(
      this,
    );
  }
}

abstract class _AppUser extends AppUser {
  const factory _AppUser(
      {final String name,
      final String appUserId,
      final String imageUrl,
      @CountryConverter() final Country country,
      final bool isVisible,
      @FlagsConverter() final List<Country> flags,
      final String comment,
      @FirestorePositionConverter() final FirestorePosition location,
      final List<String> fcmTokens}) = _$_AppUser;
  const _AppUser._() : super._();

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

  @override
  String get name;
  @override
  String get appUserId;
  @override
  String get imageUrl;
  @override
  @CountryConverter()
  Country get country;
  @override

  /// マップ上に表示されるかどうか
  bool get isVisible;
  @override

  /// 交流した人の国旗
  @FlagsConverter()
  List<Country> get flags;
  @override
  String get comment;
  @override
  @FirestorePositionConverter()
  FirestorePosition get location;
  @override
  List<String> get fcmTokens;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}
