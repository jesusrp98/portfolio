import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/home/widgets/details_tile.dart';
import 'package:portfolio/home/widgets/home_card.dart';
import 'package:portfolio/utils/personal_info.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final showHeaderImage = context.breakpoint >= LayoutBreakpoint.sm;

    final titleFontSize = context.layout.value<double>(xs: 32, md: 48);
    final titleFontHeight = context.layout.value<double>(xs: 48, md: 64);
    final descriptionFontSize = context.layout.value<double>(xs: 16, md: 24);
    final headerImageHeight = context.layout.value<double>(xs: 96, md: 128);

    return HomeCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                """
Greetings! 👋
I'm ${PersonalInfo.name}""",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: titleFontSize,
                  height: titleFontHeight / titleFontSize,
                ),
              ),
              if (showHeaderImage)
                Image.asset(
                  'assets/images/bongo-cat.gif',
                  height: headerImageHeight,
                )
            ],
          ),
          AutoSizeText.rich(
            PersonalInfo.description(context),
            style: TextStyle(
              fontSize: descriptionFontSize,
            ),
          ),
          const Divider(),
          Align(
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 64,
              runSpacing: 24,
              children: [
                const DetailsTile(
                  leading: Icon(Icons.person_rounded),
                  title: 'He/Him',
                ),
                DetailsTile.svg(
                  assetPath: 'assets/images/spanish.svg',
                  title: 'Spanish',
                ),
                DetailsTile.svg(
                  assetPath: 'assets/images/english.svg',
                  title: 'English',
                ),
                DetailsTile.svg(
                  assetPath: 'assets/images/german.svg',
                  title: 'German',
                ),
              ],
            ),
          ),
        ].separate(24),
      ),
    );
  }
}
