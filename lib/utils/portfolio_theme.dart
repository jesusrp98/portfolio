import 'package:flutter/material.dart';

class PortfolioTheme {
  const PortfolioTheme._();

  static ThemeData from({
    required Color seedColor,
    required Brightness brightness,
  }) =>
      ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: brightness,
        ),
        useMaterial3: true,
        fontFamily: 'Rubik',
        dividerTheme: const DividerThemeData(space: 0),
      );
}
