import 'package:flutter/material.dart';

mixin ColorManager {


  static Color primaryColor = HexColor.fromHex('#16919B');
  static Color accentColor = HexColor.fromHex('#c7f1ef');
  static Color greyBackground = HexColor.fromHex('##CFD9DE');

}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF' + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
