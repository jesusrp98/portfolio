import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/home/pages/home_page.dart';
import 'package:portfolio/utils/portfolio_theme.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: 'Jesus Rodriguez',
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: PortfolioTheme.from(
          seedColor: Colors.greenAccent,
          brightness: Brightness.light,
        ),
        darkTheme: PortfolioTheme.from(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}
