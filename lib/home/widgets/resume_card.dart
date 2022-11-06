import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/home/widgets/details_tile.dart';
import 'package:portfolio/home/widgets/home_card.dart';

class ResumeCard extends StatelessWidget {
  const ResumeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      child: Column(
        children: [
          DetailsTile.svg(
            assetPath: 'assets/images/figma.svg',
            title: 'Figma',
          ),
          DetailsTile.svg(
            assetPath: 'assets/images/flutter.svg',
            title: 'Flutter',
          ),
          DetailsTile.svg(
            assetPath: 'assets/images/firebase.svg',
            title: 'Firebase',
          ),
          DetailsTile.svg(
            assetPath: 'assets/images/linux.svg',
            title: 'Linux',
          ),
          DetailsTile.svg(
            assetPath: 'assets/images/amplitude.svg',
            title: 'Amplitude',
          ),
          DetailsTile.svg(
            assetPath: 'assets/images/app_store.svg',
            title: 'App Store Connect',
          ),
          DetailsTile.svg(
            assetPath: 'assets/images/uco.svg',
            title: 'Computer Engineer',
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
        ].separate(12),
      ),
    );
  }
}
