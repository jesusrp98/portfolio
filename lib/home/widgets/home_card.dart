import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

class HomeCard extends StatelessWidget {
  final Widget child;

  const HomeCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final padding = context.layout.value(
      xs: const EdgeInsets.all(16),
      md: const EdgeInsets.all(24),
    );

    return DecoratedBox(
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
        padding: padding,
        child: child,
      ),
    );
  }
}
