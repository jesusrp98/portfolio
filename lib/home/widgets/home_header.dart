import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/resume/utils/personal_info.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final showHeaderImage = context.breakpoint >= LayoutBreakpoint.md;

    final verticalPadding = context.layout.value(xs: 16.0, md: 64.0);
    final titleFontSize = context.layout.value(xs: 32.0, md: 64.0);
    final descriptionFontSize = context.layout.value(xs: 16.0, md: 18.0);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: showHeaderImage
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          if (showHeaderImage)
            DecoratedBox(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/profile.jpg'),
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white12,
                  width: 6,
                ),
              ),
              child: const SizedBox.square(dimension: 224),
            ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  PersonalInfo.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: titleFontSize,
                  ),
                ),
                AutoSizeText(
                  PersonalInfo.description,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.caption?.color,
                    fontSize: descriptionFontSize,
                  ),
                ),
              ].separate(24),
            ),
          ),
        ].separate(48),
      ),
    );
  }
}
