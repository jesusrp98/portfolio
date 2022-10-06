import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/curriculum/utils/experience.dart';
import 'package:portfolio/curriculum/widgets/details_tile.dart';
import 'package:portfolio/curriculum/widgets/experience_tile.dart';
import 'package:portfolio/utils/list_gutter.dart';

class CurriculumPage extends StatelessWidget {
  const CurriculumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Color(0xFF121212),
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
                        padding: const EdgeInsets.all(8).copyWith(top: 24),
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
                      const SizedBox(height: 40),
                      const Text(
                        'EXPERTIESE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      DetailsTile.asset(
                        imagePath: 'assets/images/figma.png',
                        title: 'Figma',
                      ),
                      const SizedBox(height: 12),
                      DetailsTile.asset(
                        imagePath: 'assets/images/flutter.png',
                        title: 'Flutter',
                      ),
                      const SizedBox(height: 12),
                      DetailsTile.asset(
                        imagePath: 'assets/images/firebase.png',
                        title: 'Firebase',
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'EDUCATION',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      DetailsTile.asset(
                        imagePath: 'assets/images/uco.png',
                        title: 'Computer Engineer',
                      ),
                      const SizedBox(height: 12),
                      DetailsTile.asset(
                        imagePath: 'assets/images/spain.png',
                        title: 'Spanish',
                      ),
                      const SizedBox(height: 12),
                      DetailsTile.asset(
                        imagePath: 'assets/images/uk.png',
                        title: 'English',
                      ),
                      const SizedBox(height: 12),
                      DetailsTile.asset(
                        imagePath: 'assets/images/germany.png',
                        title: 'German',
                      ),
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
                              onPressed: () {},
                            ),
                            IconButton(
                              tooltip: 'LinkedIn',
                              icon: const Icon(FontAwesomeIcons.linkedin),
                              onPressed: () {},
                            ),
                            IconButton(
                              tooltip: 'Email',
                              icon: const Icon(FontAwesomeIcons.github),
                              onPressed: () {},
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
                            const Text(
                              'ABOUT ME',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'I’m focused on frontend and mobile development. My greatest passions are UX/UI design and the open-source community. Love communicate and collaborate with other people around the globe.',
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                    Theme.of(context).textTheme.caption?.color,
                              ),
                            ),
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
                            const Text(
                              'EXPERIENCE',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ...[
                              for (final experience in allExperiencies)
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
