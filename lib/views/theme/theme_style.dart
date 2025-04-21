import 'package:flutter/material.dart';

import 'colors_palette.dart';
import 'styles_palette.dart';

class ThemeStyle extends ThemeExtension<ThemeStyle> {
  const ThemeStyle({required this.colors, required this.styles});

  final ColorsPalette colors;
  final StylesPalette styles;

  @override
  ThemeExtension<ThemeStyle> copyWith() => this;

  @override
  ThemeExtension<ThemeStyle> lerp(
    ThemeExtension<ThemeStyle>? other,
    double t,
  ) => this;
}
