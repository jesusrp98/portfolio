import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

class SectionHeader extends StatelessWidget {
  final Widget leading;
  final Widget title;

  const SectionHeader({
    super.key,
    required this.leading,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconTheme.merge(
          data: const IconThemeData(size: 38),
          child: leading,
        ),
        DefaultTextStyle.merge(
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 32,
          ),
          child: title,
        ),
      ].separate(16),
    );
  }
}
