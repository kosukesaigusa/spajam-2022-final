import 'package:json_annotation/json_annotation.dart';

import '../enums/country.dart';
import 'country.dart';

/// Firestore の Flags 型 と Dart の Flags 型とを変換するコンバータ。
class FlagsConverter implements JsonConverter<List<Country>, dynamic> {
  const FlagsConverter();

  @override
  List<Country> fromJson(dynamic json) {
    if (json is List<dynamic>) {
      return json
          .map((dynamic e) => const CountryConverter().fromJson(e))
          .toList();
    } else {
      return <Country>[];
    }
  }

  @override
  dynamic toJson(List<Country> flags) => <String, List<String>>{
        'flags': flags.map((e) => e.name).toList(),
      };
}
