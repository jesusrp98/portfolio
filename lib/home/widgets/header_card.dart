import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:layout/layout.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/home/widgets/home_card.dart';
import 'package:portfolio/utils/personal_info.dart';
import 'package:portfolio/utils/portfolio_urls.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
        spacing: GridSpacing.s16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Greetings!',
                          style: titleTextStyle,
                        ),
                        GridSpacing.gap16,
                        Icon(
                          Symbols.waving_hand_rounded,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: titleTextStyle?.fontSize,
                        ),
                      ],
                    ),
                    AutoSizeText(
                      "I'm ${PersonalInfo.name}",
                      style: titleTextStyle,
                    ),
                  ],
                ),
              ),
              if (showHeaderImage)
                Image.asset(
                  'assets/images/bongo-cat.gif',
                  height: headerImageHeight,
                ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: GridSpacing.s32,
            children: [
              IconButton(
                tooltip: 'Email',
                icon: const Icon(Icons.email_rounded),
                onPressed: () => launchUrlString(PortfolioUrls.email),
              ),
              IconButton(
                tooltip: 'LinkedIn',
                icon: const FaIcon(FontAwesomeIcons.linkedin),
                onPressed: () => launchUrlString(PortfolioUrls.linkedIn),
              ),
              IconButton(
                tooltip: 'GitHub',
                icon: const FaIcon(FontAwesomeIcons.github),
                onPressed: () => launchUrlString(PortfolioUrls.gitHub),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
