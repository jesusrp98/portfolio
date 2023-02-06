import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:portfolio/app.dart';

void main() {
  usePathUrlStrategy();

  return runApp(const PortfolioApp());
}
