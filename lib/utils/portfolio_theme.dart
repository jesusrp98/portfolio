import 'package:flutter/material.dart';

class PortfolioTheme {
  const PortfolioTheme._();

  static ThemeData fromColorScheme(ColorScheme colorScheme) => ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        fontFamily: 'Rubik',
        dividerTheme: const DividerThemeData(space: 0),
      );
}
