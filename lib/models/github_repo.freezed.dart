// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_repo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Repo _$RepoFromJson(Map<String, dynamic> json) {
  return _Repo.fromJson(json);
}

/// @nodoc
mixin _$Repo {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Owner get owner => throw _privateConstructorUsedError;
  String get htmlUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int get stargazersCount => throw _privateConstructorUsedError;
  int get forksCount => throw _privateConstructorUsedError;
  int get watchersCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepoCopyWith<Repo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoCopyWith<$Res> {
  factory $RepoCopyWith(Repo value, $Res Function(Repo) then) =
      _$RepoCopyWithImpl<$Res, Repo>;
  @useResult
  $Res call(
      {int id,
      String name,
      Owner owner,
      String htmlUrl,
      String description,
      DateTime? updatedAt,
      int stargazersCount,
      int forksCount,
      int watchersCount});

  $OwnerCopyWith<$Res> get owner;
}

/// @nodoc
class _$RepoCopyWithImpl<$Res, $Val extends Repo>
    implements $RepoCopyWith<$Res> {
  _$RepoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? owner = null,
    Object? htmlUrl = null,
    Object? description = null,
    Object? updatedAt = freezed,
    Object? stargazersCount = null,
    Object? forksCount = null,
    Object? watchersCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
      forksCount: null == forksCount
          ? _value.forksCount
          : forksCount // ignore: cast_nullable_to_non_nullable
              as int,
      watchersCount: null == watchersCount
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OwnerCopyWith<$Res> get owner {
    return $OwnerCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RepoCopyWith<$Res> implements $RepoCopyWith<$Res> {
  factory _$$_RepoCopyWith(_$_Repo value, $Res Function(_$_Repo) then) =
      __$$_RepoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      Owner owner,
      String htmlUrl,
      String description,
      DateTime? updatedAt,
      int stargazersCount,
      int forksCount,
      int watchersCount});

  @override
  $OwnerCopyWith<$Res> get owner;
}

/// @nodoc
class __$$_RepoCopyWithImpl<$Res> extends _$RepoCopyWithImpl<$Res, _$_Repo>
    implements _$$_RepoCopyWith<$Res> {
  __$$_RepoCopyWithImpl(_$_Repo _value, $Res Function(_$_Repo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? owner = null,
    Object? htmlUrl = null,
    Object? description = null,
    Object? updatedAt = freezed,
    Object? stargazersCount = null,
    Object? forksCount = null,
    Object? watchersCount = null,
  }) {
    return _then(_$_Repo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
      forksCount: null == forksCount
          ? _value.forksCount
          : forksCount // ignore: cast_nullable_to_non_nullable
              as int,
      watchersCount: null == watchersCount
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Repo implements _Repo {
  const _$_Repo(
      {this.id = 0,
      this.name = '',
      this.owner = Owner.defaultValue,
      this.htmlUrl = '',
      this.description = '',
      this.updatedAt,
      this.stargazersCount = 0,
      this.forksCount = 0,
      this.watchersCount = 0});

  factory _$_Repo.fromJson(Map<String, dynamic> json) => _$$_RepoFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final Owner owner;
  @override
  @JsonKey()
  final String htmlUrl;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final int stargazersCount;
  @override
  @JsonKey()
  final int forksCount;
  @override
  @JsonKey()
  final int watchersCount;

  @override
  String toString() {
    return 'Repo(id: $id, name: $name, owner: $owner, htmlUrl: $htmlUrl, description: $description, updatedAt: $updatedAt, stargazersCount: $stargazersCount, forksCount: $forksCount, watchersCount: $watchersCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Repo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.stargazersCount, stargazersCount) ||
                other.stargazersCount == stargazersCount) &&
            (identical(other.forksCount, forksCount) ||
                other.forksCount == forksCount) &&
            (identical(other.watchersCount, watchersCount) ||
                other.watchersCount == watchersCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, owner, htmlUrl,
      description, updatedAt, stargazersCount, forksCount, watchersCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepoCopyWith<_$_Repo> get copyWith =>
      __$$_RepoCopyWithImpl<_$_Repo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepoToJson(
      this,
    );
  }
}

abstract class _Repo implements Repo {
  const factory _Repo(
      {final int id,
      final String name,
      final Owner owner,
      final String htmlUrl,
      final String description,
      final DateTime? updatedAt,
      final int stargazersCount,
      final int forksCount,
      final int watchersCount}) = _$_Repo;

  factory _Repo.fromJson(Map<String, dynamic> json) = _$_Repo.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  Owner get owner;
  @override
  String get htmlUrl;
  @override
  String get description;
  @override
  DateTime? get updatedAt;
  @override
  int get stargazersCount;
  @override
  int get forksCount;
  @override
  int get watchersCount;
  @override
  @JsonKey(ignore: true)
  _$$_RepoCopyWith<_$_Repo> get copyWith => throw _privateConstructorUsedError;
}
