import 'package:flutter/material.dart';

class ResponsiveSliverLayout extends StatelessWidget {
  final Widget child;
  final double pageSize;

  const ResponsiveSliverLayout({
    super.key,
    required this.child,
    this.pageSize = 1200,
  });

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.crossAxisExtent < pageSize;

        return SliverPadding(
          padding: isMobile
              ? EdgeInsets.zero
              : EdgeInsets.symmetric(
                  horizontal: (constraints.crossAxisExtent - pageSize) / 2,
                ),
          sliver: child,
        );
      },
    );
  }
}
