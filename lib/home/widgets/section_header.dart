import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

class SectionHeader extends StatelessWidget {
  final Widget leading;
  final Widget title;

  const SectionHeader({
    super.key,
    required this.leading,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconTheme.merge(
          data: IconThemeData(
            color: Theme.of(context).colorScheme.onBackground,
            size: 40,
          ),
          child: leading,
        ),
        DefaultTextStyle.merge(
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
          child: title,
        ),
      ].separate(8),
    );
  }
}
