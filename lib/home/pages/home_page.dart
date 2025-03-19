// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:portfolio/home/widgets/about_card.dart';
import 'package:portfolio/home/widgets/header_card.dart';
import 'package:portfolio/home/widgets/section_header.dart';
import 'package:portfolio/home/widgets/skill_card.dart';
import 'package:portfolio/home/widgets/work_card.dart';
import 'package:portfolio/utils/personal_info.dart';
import 'package:portfolio/utils/portfolio_urls.dart';
import 'package:portfolio/widgets/footer_bar.dart';
import 'package:portfolio/widgets/responsive_layout.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        child: Column(
          children: [
            Column(
              spacing: GridSpacing.s16,
              children: [
                const HeaderCard(),
                const SectionHeader(
                  leading: Icon(Symbols.favorite_rounded, fill: 1),
                  title: Text('ABOUT'),
                ),
                for (final experience in PersonalInfo.about)
                  AboutCard(experience: experience),
                const SectionHeader(
                  leading: Icon(Symbols.history_edu_rounded, fill: 1),
                  title: Text('SKILLS'),
                ),
                for (final experience in PersonalInfo.skills)
                  SkillCard(experience: experience),
                const SectionHeader(
                  leading: Icon(Symbols.verified_rounded, fill: 1),
                  title: Text('WORK'),
                ),
                TextButton(
                  onPressed: () => launchUrlString(PortfolioUrls.linkedIn),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: [
                      Flexible(
                        child: Text(
                          'Take a look at LinkedIn for a more extensive resumé',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Icon(
                        Symbols.launch_rounded,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
                for (final experience in PersonalInfo.works)
                  WorkCard(experience: experience),
              ],
            ),
            const FooterBar(),
          ],
        ),
      ),
    );
  }
}
