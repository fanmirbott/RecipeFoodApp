import 'package:flutter/material.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';

class AppDark {
  static final ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Appcolors().backgroundBegie,
    appBarTheme: AppBarTheme(
      backgroundColor: Appcolors().backgroundBegie,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 13,
        color: Appcolors().white,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Appcolors().white,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Appcolors().white,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Appcolors().white,
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Appcolors().white,
      onPrimary: Appcolors().white,
      secondary: Appcolors().white,
      onSecondary: Appcolors().white,
      error: Appcolors().redpinkmain,
      onError: Appcolors().redpinkmain,
      surface: Appcolors().white,
      onSurface: Appcolors().white,
    ),

  );
}

class AppNight {
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Appcolors().white,
    appBarTheme: AppBarTheme(
      backgroundColor: Appcolors().white,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 13,
        color: Appcolors().backgroundBegie,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Appcolors().backgroundBegie,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Appcolors().backgroundBegie,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Appcolors().backgroundBegie,
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Appcolors().backgroundBegie,
      onPrimary: Appcolors().backgroundBegie,
      secondary: Appcolors().redpinkmain,
      onSecondary: Appcolors().redpinkmain,
      error: Appcolors().redpinkmain,
      onError: Appcolors().redpinkmain,
      surface: Appcolors().backgroundBegie,
      onSurface: Appcolors().backgroundBegie,
    ),
  );
}
