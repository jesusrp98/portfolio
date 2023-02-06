import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:portfolio/flutter_packages/widgets/flutter_package_card.dart';
import 'package:portfolio/home/widgets/flutter_packages_card_leading.dart';
import 'package:portfolio/home/widgets/work_card.dart';
import 'package:portfolio/utils/personal_info.dart';
import 'package:portfolio/widgets/contact_actions.dart';
import 'package:portfolio/widgets/footer_bar.dart';
import 'package:portfolio/widgets/responsive_layout.dart';

class FlutterPackagesPage extends StatelessWidget {
  const FlutterPackagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          ContactActions(),
        ],
      ),
      body: ResponsiveLayout(
        child: Column(
          children: [
            Column(
              children: [
                const WorkCard(
                  leading: FlutterPackagesCardLeading(),
                  work: PersonalInfo.flutterPackages,
                ),
                for (final package in PersonalInfo.packages)
                  FlutterPackageCard(package: package),
              ].separateWith(GridSpacing.gap16),
            ),
            const FooterBar(),
          ],
        ),
      ),
    );
  }
}
