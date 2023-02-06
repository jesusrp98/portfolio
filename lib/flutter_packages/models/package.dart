import 'package:flutter/widgets.dart';

class Package {
  final Widget leading;
  final String name;
  final String description;

  const Package({
    required this.leading,
    required this.name,
    required this.description,
  });

  String get url => 'https://pub.dev/packages/$name';
}
