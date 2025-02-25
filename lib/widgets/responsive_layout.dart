import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';

class ResponsiveLayout extends StatelessWidget {
  static const basePadding = EdgeInsets.only(top: GridSpacing.s24);
  static const contentSize = 1300;

  final Widget child;

  const ResponsiveLayout({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isPhoneLayout = constraints.maxWidth < contentSize;

        return SingleChildScrollView(
          padding: isPhoneLayout
              ? basePadding
              : basePadding.add(
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
