import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

class HomeCard extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget child;

  const HomeCard({
    super.key,
    this.padding,
    required this.child,
  });

  static EdgeInsets resolvePadding(BuildContext context) =>
      context.layout.value(
        xs: const EdgeInsets.all(16),
        md: const EdgeInsets.all(24),
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: padding ?? resolvePadding(context),
        child: child,
      ),
    );
  }
}
