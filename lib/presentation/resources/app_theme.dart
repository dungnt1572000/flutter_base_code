import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme(Brightness brightness) {
  final colors = brightness == Brightness.light ? colorsLight : colorsDark;

  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: colors.backgroundPrimary,
      foregroundColor: colors.textPrimary,
    ),
    brightness: brightness,
    scaffoldBackgroundColor: colors.backgroundPrimary,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
  );
}
