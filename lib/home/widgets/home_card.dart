import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:layout/layout.dart';

class HomeCard extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget child;

  const HomeCard({
    required this.child,
    super.key,
    this.padding,
  });

  static EdgeInsets resolvePadding(BuildContext context) =>
      context.layout.value(
        xs: const EdgeInsets.all(GridSpacing.s16),
        md: const EdgeInsets.all(GridSpacing.s24),
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
