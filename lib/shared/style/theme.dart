import 'package:flutter/material.dart';
import 'package:newsapp/shared/style/app_colors.dart';

class appTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: appColors.primaryLight,
      primary: appColors.primaryLight,
      onPrimary: appColors.onPrimaryLight,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(55), bottomLeft: Radius.circular(55)),
      ),
      backgroundColor: appColors.primaryLight,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white, size: 40),
    ),
  );
}
