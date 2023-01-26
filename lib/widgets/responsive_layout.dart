import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget child;
  final double pageSize;

  const ResponsiveLayout({
    super.key,
    required this.child,
    this.pageSize = 1200,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < pageSize;

        return SingleChildScrollView(
          padding: isMobile
              ? const EdgeInsets.symmetric(horizontal: 16)
              : EdgeInsets.symmetric(
                  horizontal: (constraints.maxWidth - pageSize) / 2,
                ),
          child: child,
        );
      },
    );
  }
}
