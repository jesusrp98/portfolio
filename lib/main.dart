import 'package:flutter/material.dart';
import 'package:portfolio/curriculum/pages/curriculum_page.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'portfolio',
      home: const CurriculumPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Rubik'),
    );
  }
}
