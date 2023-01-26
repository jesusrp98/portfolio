import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/router/app_router.dart';
import 'package:portfolio/utils/portfolio_theme.dart';

class PortfolioApp extends StatelessWidget {
  static final router = AppRouter.initialize();

  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp.router(
        title: 'Jesus Rodriguez',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: PortfolioTheme.fromColorScheme(
          ColorScheme.fromSeed(
            seedColor: Colors.purple,
          ),
        ),
        darkTheme: PortfolioTheme.fromColorScheme(
          ColorScheme.fromSeed(
            seedColor: Colors.purple,
            brightness: Brightness.dark,
          ),
        ),
      ),
    );
  }
}
