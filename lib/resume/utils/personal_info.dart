// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/widgets.dart';
import 'package:portfolio/resume/models/experience.dart';

class PersonalInfo {
  const PersonalInfo._();

  static const name = 'Jesus Rodriguez';

  static const description = TextSpan(
    children: [
      TextSpan(text: "I'm a "),
      TextSpan(
        text: 'product developer',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      TextSpan(
        text:
            ', focused on crafting intuitive and beautiful digital experiences.',
      ),
      TextSpan(text: '\n\n'),
      TextSpan(text: 'With a background in '),
      TextSpan(
        text: 'Computer Engineering',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      TextSpan(text: ", I've always have had a passion for product design."),
      TextSpan(text: '\n\n'),
      TextSpan(text: 'Based in Spain 🇪🇸'),
    ],
  );

  static const experience = [
    Experience(
      imagePath: 'assets/images/fave.jpg',
      company: 'Fave',
      position: 'Flutter Developer',
      period: '2022',
      tasks: [
        'Implemented complex social media features, like real-time chat and news feed.',
        'Worked hand-by-hand with the design people when developing new features.',
        'Improved local and push notifications on both iOS and Android.',
        'Reworked navigation system, in order to support deep links.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/reflectly.jpg',
      company: 'Reflectly',
      position: 'Flutter Developer',
      period: '2021 - 2022',
      tasks: [
        'Used Firebase to store user data, and making it accessible offline.',
        'Implemented complex designs and fluent animations.',
        'Developed new features using low-level Flutter.',
        'Researched user data with Amplitude analytics.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/eyeem.jpg',
      company: 'EyeEm',
      position: 'Flutter Developer',
      period: '2020 - 2021',
      tasks: [
        'Developed new features in Flutter & deploy them to existing native mobile apps.',
        'Managed app releases through production channels.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/ronald_mcdonald.png',
      company: 'Ronald McDonald Foundation',
      position: 'Freelancer',
      period: '2020 - 2021',
      tasks: [
        'Used Firebase service to store user information.',
        'Developed mobile app and CMS web page using Flutter.',
        'Released mobile app to both App Store and Google Play.',
        'Implemented real-time chat between users of the platform.',
        'Acted as a product manager and managed team of developers.',
        'Used GitHub Actions to deploy web page to Firebase Hosting.'
      ],
    ),
    Experience(
      imagePath: 'assets/images/wealize.png',
      company: 'Wealize',
      position: 'Software Developer',
      period: '2020',
      tasks: [
        'Developed React-based frontend for chatbot management system.',
        'Worked on IBM Watson-based NLP systems.',
      ],
    ),
  ];
}
