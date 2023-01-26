import 'package:flutter/material.dart';

class PortfolioTheme {
  const PortfolioTheme._();

  static ThemeData from({required ColorScheme colorScheme}) => ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        fontFamily: 'Rubik',
      );
}
