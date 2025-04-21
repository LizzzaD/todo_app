import 'package:flutter/material.dart';

import '../theme/colors_palette.dart';
import '../theme/styles_palette.dart';
import '../theme/theme_style.dart';

extension BuildContextExtension on BuildContext {
  bool get isKeyboardShown => MediaQuery.of(this).viewInsets.bottom != 0;

  ColorsPalette get colors => Theme.of(this).extension<ThemeStyle>()!.colors;

  StylesPalette get styles => Theme.of(this).extension<ThemeStyle>()!.styles;
}
