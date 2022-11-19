import 'package:flutter/material.dart';

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

extension CountryExtension on Country {
  Widget icon({
    double? width,
    double? height,
  }) {
    switch (this) {
      case Country.japan:
        return Image.asset(
          'icons/flags/png/jp.png',
          package: 'country_icons',
          width: width,
          height: height,
        );
      case Country.korea:
        return Image.asset(
          'icons/flags/png/kr.png',
          package: 'country_icons',
          width: width,
          height: height,
        );
      case Country.china:
        return Image.asset(
          'icons/flags/png/cn.png',
          package: 'country_icons',
          width: width,
          height: height,
        );
      case Country.france:
        return Image.asset(
          'icons/flags/png/fr.png',
          package: 'country_icons',
          width: width,
          height: height,
        );
      case Country.spain:
        return Image.asset(
          'icons/flags/png/es.png',
          package: 'country_icons',
          width: width,
          height: height,
        );
      case Country.america:
        return Image.asset(
          'icons/flags/png/us.png',
          package: 'country_icons',
          width: width,
          height: height,
        );
      case Country.brazil:
        return Image.asset(
          'icons/flags/png/br.png',
          package: 'country_icons',
          width: width,
          height: height,
        );
      case Country.unknown:
        return const SizedBox.shrink();
    }
  }
}
