import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/json_converters/country.dart';
import '../utils/json_converters/flags.dart';
import 'firestore_position.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    @Default('') String name,
    @Default('') String appUserId,
    @Default('') String imageUrl,
    @CountryConverter() @Default(Country.unknown) Country country,

    /// マップ上に表示されるかどうか
    @Default(true) bool isVisible,

    /// 交流した人の国旗
    @FlagsConverter() @Default(<Country>[]) List<Country> flags,
    @Default('') String comment,
    @FirestorePositionConverter()
    @Default(FirestorePosition.defaultValue)
        FirestorePosition location,
    @Default(<String>[]) List<String> fcmTokens,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  factory AppUser.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return AppUser.fromJson(<String, dynamic>{
      ...data,
      'appUserId': ds.id,
    });
  }

  const AppUser._();
}

enum Country {
  japan,
  korea,
  china,
  france,
  spain,
  america,
  brazil,
  unknown,
}
