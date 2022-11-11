import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';

class AppStyles {
  const AppStyles._();

  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Rubik',
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
        dividerTheme: const DividerThemeData(space: 0),
      );

  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        shadowColor: Colors.transparent,
        cardColor: AppColors.darkCardColor,
        fontFamily: 'Rubik',
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
        dividerTheme: const DividerThemeData(space: 0),
      );
}
