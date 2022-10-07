import 'package:flutter/material.dart';
import 'package:portfolio/app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();

  runApp(const App());
}
