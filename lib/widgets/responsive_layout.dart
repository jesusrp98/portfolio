import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';

class ResponsiveLayout extends StatelessWidget {
  static const contentHorizontalPadding = EdgeInsets.symmetric(
    horizontal: GridSpacing.s16,
  );
  static const contentSize = 1200;

  final Widget child;

  const ResponsiveLayout({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isPhoneLayout = constraints.maxWidth < contentSize;

        return SingleChildScrollView(
          padding: isPhoneLayout
              ? const EdgeInsets.symmetric(horizontal: GridSpacing.s16)
              : contentHorizontalPadding.add(
                  EdgeInsets.symmetric(
                    horizontal: (constraints.maxWidth - contentSize) / 2,
                  ),
                ),
          child: child,
        );
      },
    );
  }
}
