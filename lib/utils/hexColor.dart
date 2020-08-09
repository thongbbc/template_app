import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    var newHexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      newHexColor = "FF$hexColor";
    }
    return int.parse(newHexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
