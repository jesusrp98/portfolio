import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/home/widgets/details_tile.dart';
import 'package:portfolio/home/widgets/home_card.dart';
import 'package:portfolio/utils/personal_info.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final showHeaderImage = context.breakpoint >= LayoutBreakpoint.sm;

    final titleTextStyle = context.layout
        .value(
          xs: Theme.of(context).textTheme.headlineLarge,
          md: Theme.of(context).textTheme.displayMedium,
        )
        ?.copyWith(fontWeight: FontWeight.w600);

    final descriptionTextStyle = context.layout.value(
      xs: Theme.of(context).textTheme.bodyLarge,
      md: Theme.of(context).textTheme.headlineSmall,
    );

    final headerImageHeight = context.layout.value<double>(xs: 96, md: 128);

    return HomeCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Greetings!',
                        style: titleTextStyle,
                      ),
                      const Gap(16),
                      Icon(
                        Icons.waving_hand_outlined,
                        color: Theme.of(context).colorScheme.onSurface,
                        size: titleTextStyle?.fontSize,
                      )
                    ],
                  ),
                  Text(
                    "I'm ${PersonalInfo.name}",
                    style: titleTextStyle,
                  ),
                ],
              ),
              if (showHeaderImage)
                Image.asset(
                  'assets/images/bongo-cat.gif',
                  height: headerImageHeight,
                )
            ],
          ),
          AutoSizeText.rich(
            PersonalInfo.description1,
            style: descriptionTextStyle,
          ),
          AutoSizeText.rich(
            PersonalInfo.description2,
            style: descriptionTextStyle,
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
                DetailsTile.asset(
                  assetPath: 'assets/images/spanish.png',
                  title: 'Spanish',
                ),
                DetailsTile.asset(
                  assetPath: 'assets/images/english.png',
                  title: 'English',
                ),
                DetailsTile.asset(
                  assetPath: 'assets/images/german.png',
                  title: 'German',
                ),
              ],
            ),
          ),
        ].separate(16),
      ),
    );
  }
}
