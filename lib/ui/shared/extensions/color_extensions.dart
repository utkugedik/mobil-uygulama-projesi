import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  MaterialColor get toMaterialColor {
    String color = toHex().replaceAll('#', '0xff');
    int hex = int.parse(color);
    MaterialColor materialColor = MaterialColor(
      hex,
      <int, Color>{
        50: Color(hex),
        100: Color(hex),
        200: Color(hex),
        300: Color(hex),
        400: Color(hex),
        500: Color(hex),
        600: Color(hex),
        700: Color(hex),
        800: Color(hex),
        900: Color(hex),
      },
    );
    return materialColor;
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
