import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';

class DetailsTag extends StatelessWidget {
  final Widget child;

  const DetailsTag({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.04),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: GridSpacing.s12,
          vertical: GridSpacing.s4,
        ),
        child: DefaultTextStyle.merge(
          style: Theme.of(context).textTheme.titleMedium,
          child: child,
        ),
      ),
    );
  }
}
