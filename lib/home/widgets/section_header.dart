import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';

class SectionHeader extends StatelessWidget {
  final Widget leading;
  final Widget title;

  const SectionHeader({
    required this.leading,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconTheme.merge(
          data: IconThemeData(
            color: Theme.of(context).colorScheme.onBackground,
            size: GridSpacing.s40,
          ),
          child: leading,
        ),
        DefaultTextStyle.merge(
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
          child: title,
        ),
      ].separateWith(GridSpacing.gap8),
    );
  }
}
