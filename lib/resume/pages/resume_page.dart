import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/resume/utils/personal_info.dart';
import 'package:portfolio/resume/widgets/details_tile.dart';
import 'package:portfolio/resume/widgets/experience_tile.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/list_gutter.dart';
import 'package:portfolio/utils/urls.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
                        DetailsTile.asset(
                          imagePath: 'assets/images/figma.png',
                          title: 'Figma',
                        ),
                        DetailsTile.asset(
                          imagePath: 'assets/images/flutter.png',
                          title: 'Flutter',
                        ),
                        DetailsTile.asset(
                          imagePath: 'assets/images/firebase.png',
                          title: 'Firebase',
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
                        DetailsTile.asset(
                          imagePath: 'assets/images/uco.png',
                          title: 'Computer Engineer',
                        ),
                        DetailsTile.asset(
                          imagePath: 'assets/images/spain.png',
                          title: 'Spanish',
                        ),
                        DetailsTile.asset(
                          imagePath: 'assets/images/uk.png',
                          title: 'English',
                        ),
                        DetailsTile.asset(
                          imagePath: 'assets/images/germany.png',
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
                              fontSize: 48,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'PRODUCT DESIGNER',
                            style: TextStyle(
                              fontSize: 24,
                              color: Theme.of(context).textTheme.caption?.color,
                            ),
                          ),
                          Text(
                            'SOFTWARE DEVELOPER',
                            style: TextStyle(
                              fontSize: 24,
                              color: Theme.of(context).textTheme.caption?.color,
                            ),
                          ),
                        ].separate(),
                      ),
                      IconTheme.merge(
                        data: const IconThemeData(size: 40),
                        child: Row(
                          children: [
                            IconButton(
                              tooltip: 'Email',
                              icon: const Icon(Icons.email_rounded),
                              onPressed: () => launchUrlString(Urls.email),
                            ),
                            IconButton(
                              tooltip: 'LinkedIn',
                              icon: const Icon(FontAwesomeIcons.linkedin),
                              onPressed: () => launchUrlString(Urls.linkedIn),
                            ),
                            IconButton(
                              tooltip: 'GitHub',
                              icon: const Icon(FontAwesomeIcons.github),
                              onPressed: () => launchUrlString(Urls.gitHub),
                            ),
                          ].separate(space: 24),
                        ),
                      ),
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
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
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
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
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
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
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
