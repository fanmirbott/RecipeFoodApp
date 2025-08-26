import 'package:flutter/material.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';

class AppNight {
  static final ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Appcolors().backgroundBegie,
    primaryColor: Colors.blueGrey,
    appBarTheme: AppBarTheme(
      backgroundColor: Appcolors().backgroundBegie,
    ),
  );
}

class AppDark {
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.blueAccent,
    primaryColor: Colors.deepPurple,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
  );
}
