import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';

class HomeCard extends StatelessWidget {
  static const defaultPadding = EdgeInsets.all(GridSpacing.s24);

  final EdgeInsets? padding;
  final ShapeBorder? shape;
  final Widget child;

  const HomeCard({
    required this.child,
    super.key,
    this.padding,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
      shadowColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      shape: shape,
      child: Padding(
        padding: padding ?? defaultPadding,
        child: child,
      ),
    );
  }
}
