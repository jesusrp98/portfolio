import 'package:flutter/material.dart';

class AppStyles {
  const AppStyles._();

  static final light = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Rubik',
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Rubik',
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    ),
  );
}
