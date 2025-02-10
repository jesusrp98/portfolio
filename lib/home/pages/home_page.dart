import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:portfolio/flutter_packages/routes/flutter_packages_route.dart';
import 'package:portfolio/home/widgets/about_card.dart';
import 'package:portfolio/home/widgets/flutter_packages_card_leading.dart';
import 'package:portfolio/home/widgets/header_card.dart';
import 'package:portfolio/home/widgets/journey_card.dart';
import 'package:portfolio/home/widgets/resume_card.dart';
import 'package:portfolio/home/widgets/section_header.dart';
import 'package:portfolio/home/widgets/work_card.dart';
import 'package:portfolio/utils/personal_info.dart';
import 'package:portfolio/widgets/footer_bar.dart';
import 'package:portfolio/widgets/responsive_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderCard(),
                const SectionHeader(
                  leading: Icon(Symbols.verified_rounded, fill: 1),
                  title: Text('WORK'),
                ),
                WorkCard(
                  leading: const FlutterPackagesCardLeading(),
                  work: PersonalInfo.flutterPackages,
                  onTap: () => context.push(
                    FlutterPackagesRoute.flutterPackagesPath,
                  ),
                ),
                const SectionHeader(
                  leading: Icon(Symbols.favorite_rounded, fill: 1),
                  title: Text('ABOUT'),
                ),
                for (final experience in PersonalInfo.about)
                  AboutCard(experience: experience),
                const SectionHeader(
                  leading: Icon(Symbols.history_edu_rounded, fill: 1),
                  title: Text('RESUME'),
                ),
                const ResumeCard(),
                const JourneyCard(),
              ].separateWith(GridSpacing.gap16),
            ),
            const FooterBar(),
          ],
        ),
      ),
    );
  }
}
