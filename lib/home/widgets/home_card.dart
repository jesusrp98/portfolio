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
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
            ),
          ],
        ),
        child: Padding(
          padding: padding ?? resolvePadding(context),
          child: child,
        ),
      ),
    );
  }
}
