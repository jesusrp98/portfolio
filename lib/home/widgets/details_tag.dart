import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';

class DetailsTag extends StatelessWidget {
  final Widget child;

  const DetailsTag({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: GridSpacing.s12,
          vertical: GridSpacing.s4,
        ),
        child: IconTheme.merge(
          data: IconThemeData(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            size: GridSpacing.s20,
          ),
          child: DefaultTextStyle.merge(
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
            child: child,
          ),
        ),
      ),
    );
  }
}
