// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:portfolio/home/models/experience.dart';

class PersonalInfo {
  const PersonalInfo._();

  static const name = 'Jesus Rodriguez';

  static TextSpan get description1 => const TextSpan(
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
        ],
      );

  static TextSpan get description2 => const TextSpan(
        children: [
          TextSpan(text: 'With a background in '),
          TextSpan(
            text: 'Computer Engineering',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: ", I've always have had a passion for product design.",
          ),
        ],
      );

  static const about = [
    Experience(
      imagePath: 'assets/images/profile.jpg',
      title: 'Hello, World!',
      details: [
        "I've been playing with computers ever since I was little, learning mostly on my own.",
        "What I'm passionate about is creating experiences around the products and services I use every single day.",
      ],
    ),
    Experience(
      imagePath: 'assets/images/community.jpg',
      title: 'Community driven',
      details: [
        "Since the beginning, I've been deeply involved with the developer community, organizing and attending events.",
        'Helped with the organization of the first Flutter-exclusive meetup - FlutterConf - back in 2019.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/food.jpg',
      title: 'Excellent cooker',
      details: [
        "Who doesn't love a good-looking and spongy vegan banana bread?",
        "Also, don't get me started on Thai food.",
      ],
    ),
  ];

  static const resume = [
    Experience(
      imagePath: 'assets/images/flutter.svg',
      title: 'Flutter',
      details: [
        'Realized complex designs and fluent animations.',
        'Deploy Flutter features into existing native mobile apps.',
        'Worked with local and push notifications on both iOS and Android.',
        'Implemented complex navigation systems, with deep linking support.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/figma.svg',
      title: 'Figma',
      details: [
        'Implemented complete design systems.',
        'Worked inside several professional-level projects.',
        'Made extensive use of components all around the project.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/firebase.svg',
      title: 'Firebase',
      details: [
        'Played with offline data persistence.',
        'Made extensive use of Firestore and all its features.',
        'Worked with custom Firebase Functions using TypeScript.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/amplitude.svg',
      title: 'Amplitude',
      details: [
        'Implemented full analytics system on mobile apps.',
        'Made user behaviour dictate  the app development.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/uco.svg',
      title: 'Computer Engineer',
      details: [
        'Learned the fundamentals of ML and AI.',
        'Collaborated with local Open Source Group.',
        'Experienced low level programming with C and C++.',
      ],
    ),
  ];

  static const journey = [
    Experience(
      imagePath: 'assets/images/bejao.png',
      title: 'BeJao',
      subtitle: 'Flutter Developer',
      trailing: '2022',
      details: [
        'Implemented complex multimedia-powered exercice guide experience.',
        'Helped to design and develop custom dynamic Material theme.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/fave.jpg',
      title: 'Fave',
      subtitle: 'Flutter Developer',
      trailing: '2022',
      details: [
        'Implemented complex social media features, like real-time chat and news feed.',
        'Worked hand-by-hand with the design people when developing new features.',
        'Improved local and push notifications on both iOS and Android.',
        'Reworked navigation system, in order to support deep links.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/reflectly.jpg',
      title: 'Reflectly',
      subtitle: 'Flutter Developer',
      trailing: '2021 - 2022',
      details: [
        'Used Firebase to store user data, and making it accessible offline.',
        'Implemented complex designs and fluent animations.',
        'Developed new features using low-level Flutter.',
        'Researched user data with Amplitude analytics.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/eyeem.jpg',
      title: 'EyeEm',
      subtitle: 'Flutter Developer',
      trailing: '2020 - 2021',
      details: [
        'Developed new features in Flutter & deploy them to existing native mobile apps.',
        'Managed app releases through production channels.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/ronald_mcdonald.png',
      title: 'Ronald McDonald Foundation',
      subtitle: 'Freelancer',
      trailing: '2020 - 2021',
      details: [
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
      title: 'Wealize',
      subtitle: 'Full-Stack Developer',
      trailing: '2019 - 2020',
      details: [
        'Developed React-based frontend for chatbot management system.',
        'Worked on IBM Watson-based NLP systems.',
      ],
    ),
  ];
}
