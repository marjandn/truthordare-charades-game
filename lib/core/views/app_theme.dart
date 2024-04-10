import 'package:flutter/material.dart';

import '../global/constants.dart';
import 'colors.dart';

class AppTheme {
  late final String persianFont;

  late final Color primaryColor;
  late final Color splashColor;
  late final Color bgColor;
  late final Color secondryColor;
  late final Color shadowColor;

  AppTheme.lightThem()
      : persianFont = Constants.fontFamily,
        primaryColor = AppColors.primaryColor,
        splashColor = AppColors.gray,
        bgColor = AppColors.primaryColor,
        shadowColor = AppColors.gray,
        secondryColor = AppColors.accentColor;

  ThemeData getTheme() => ThemeData(
        fontFamily: persianFont,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: secondryColor,
          background: bgColor,
          shadow: shadowColor,
        ),
        scaffoldBackgroundColor: bgColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
