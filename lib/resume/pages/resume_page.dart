import 'package:flutter/material.dart';
import 'package:portfolio/resume/utils/personal_info.dart';
import 'package:portfolio/resume/widgets/details_tile.dart';
import 'package:portfolio/resume/widgets/experience_tile.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/list_gutter.dart';
import 'package:portfolio/widgets/contact_actions.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.resumeLeadingBarBackgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(4, 0),
                  blurRadius: 12,
                  spreadRadius: 4,
                  color: Colors.black26,
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8).copyWith(
                          top: 24,
                          bottom: 48,
                        ),
                        child: DecoratedBox(
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
                          child: const SizedBox.square(dimension: 192),
                        ),
                      ),
                      ...[
                        const Text(
                          'EXPERTIESE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                      ].separate(),
                      const SizedBox(height: 24),
                      ...[
                        const Text(
                          'EDUCATION',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
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
                      ].separate(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(48),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'JESUS RODRIGUEZ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 48,
                            ),
                          ),
                          Text(
                            'PRODUCT DEVELOPER',
                            style: TextStyle(
                              color: Theme.of(context).textTheme.caption?.color,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                        ].separate(),
                      ),
                      const ContactActions(iconSize: 40),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...[
                              const Text(
                                'ABOUT ME',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                PersonalInfo.description,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.color,
                                ),
                              ),
                            ].separate(),
                            const SizedBox(height: 32),
                            const Text(
                              'PROJECTS',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 48),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...[
                              const Text(
                                'EXPERIENCE',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                ),
                              ),
                              for (final experience in PersonalInfo.experience)
                                ExperienceTile(experience: experience),
                            ].separate()
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
