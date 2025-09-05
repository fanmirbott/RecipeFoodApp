import 'package:flutter/material.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';

class AppDark {
  static final ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor:  AppColors.backgroundBeige,
    appBarTheme: AppBarTheme(
      backgroundColor:  AppColors.backgroundBeige,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 13,
        color:  AppColors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color:  AppColors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color:  AppColors.white,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color:  AppColors.white,
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary:  AppColors.white,
      onPrimary:  AppColors.white,
      secondary:  AppColors.white,
      onSecondary:  AppColors.white,
      error:  AppColors.redPinkMain,
      onError:  AppColors.redPinkMain,
      surface:  AppColors.white,
      onSurface:  AppColors.white,
    ),

  );
}

class AppNight {
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor:  AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor:  AppColors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 13,
        color:  AppColors.backgroundBeige,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color:  AppColors.backgroundBeige,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color:  AppColors.backgroundBeige,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color:  AppColors.backgroundBeige,
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary:  AppColors.backgroundBeige,
      onPrimary:  AppColors.backgroundBeige,
      secondary:  AppColors.redPinkMain,
      onSecondary:  AppColors.redPinkMain,
      error:  AppColors.redPinkMain,
      onError:  AppColors.redPinkMain,
      surface:  AppColors.backgroundBeige,
      onSurface:  AppColors.backgroundBeige,
    ),
  );
}
