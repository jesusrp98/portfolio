import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  static const contentHorizontalPadding = EdgeInsets.symmetric(horizontal: 16);
  static const contentSize = 1200;

  final Widget child;

  const ResponsiveLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isPhoneLayout = constraints.maxWidth < contentSize;

        return SingleChildScrollView(
          padding: isPhoneLayout
              ? const EdgeInsets.symmetric(horizontal: 16)
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
