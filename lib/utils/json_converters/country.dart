import 'package:json_annotation/json_annotation.dart';

import '../enums/country.dart';

/// Firestore の Country 型 と Dart の Country 型とを変換するコンバータ。
class CountryConverter implements JsonConverter<Country, String> {
  const CountryConverter();

  @override
  Country fromJson(dynamic json) {
    for (final country in Country.values) {
      if (country.name == json.toString()) {
        return country;
      }
    }
    return Country.unknown;
  }

  @override
  String toJson(Country country) => country.name;
}
