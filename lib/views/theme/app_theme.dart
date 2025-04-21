import 'package:flutter/material.dart';

import 'colors_palette.dart';
import 'styles_palette.dart';
import 'theme_style.dart';

class AppTheme {
  static ThemeData get getLightTheme => ThemeData(
    extensions: [
      ThemeStyle(colors: darkColorsPalette, styles: lightStylePalette),
    ],
    brightness: Brightness.light,
    scaffoldBackgroundColor: darkColorsPalette.backgroundColor,
  );

  static ThemeData get getDarkTheme => ThemeData(
    extensions: [
      ThemeStyle(colors: darkColorsPalette, styles: lightStylePalette),
    ],
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkColorsPalette.backgroundColor,
  );

  static const darkColorsPalette = ColorsPalette(
    secondaryColor: Color.fromRGBO(53, 51, 88, 1),
    backgroundColor: Color.fromRGBO(220, 220, 240, 1.0),
    textSecondaryColor: Color.fromRGBO(166, 178, 236, 1),
    white: Color.fromRGBO(255, 255, 255, 1),
    black: Color.fromRGBO(0, 0, 0, 1),
    blue: Color.fromRGBO(141, 128, 255, 1.0),
    purple: Color.fromRGBO(227, 115, 255, 1.0),
    red: Color.fromRGBO(255, 128, 152, 1.0),
    green: Color.fromRGBO(102, 255, 138, 1.0),
    yellow: Color.fromRGBO(255, 247, 118, 1.0),
    lightBlue: Color.fromRGBO(114, 245, 255, 1.0),
    orange: Color.fromRGBO(255, 200, 123, 1.0),
    pink: Color.fromRGBO(255, 121, 206, 1.0),
  );

  static StylesPalette lightStylePalette = StylesPalette(
    bold20: Roboto.bold20,
    bold16: Roboto.bold16,
    semibold24: Roboto.semibold24,
    semibold16: Roboto.semibold16,
    semibold12: Roboto.semibold12,
    medium32: Roboto.medium32,
    medium24: Roboto.medium24,
    medium16: Roboto.medium16,
    medium12: Roboto.medium12,
    medium10: Roboto.medium10,
    medium8: Roboto.medium8,
    regular16: Roboto.regular16,
    regular12: Roboto.regular12,
    regular10: Roboto.regular10,
    light24: Roboto.light24,
    light10: Roboto.light10,
  );
}
