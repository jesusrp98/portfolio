// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:portfolio/home/models/experience.dart';
import 'package:portfolio/utils/portfolio_urls.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PersonalInfo {
  const PersonalInfo._();

  static const name = 'Jesus Rodriguez';

  static TextSpan get description1 => const TextSpan(
        children: [
          TextSpan(text: "I'm a "),
          TextSpan(
            text: 'product developer',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text:
                ', focused on crafting intuitive and beautiful digital experiences.',
          ),
        ],
      );

  static const description2 = "Let's have a chat!";

  static const about = [
    Experience(
      imagePath: 'assets/images/paris.png',
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
  ];

  static const skills = [
    Experience(
      imagePath: 'assets/images/flutter.png',
      title: 'Flutter',
      details: [
        'Realized complex designs and fluent animations.',
        'Deployed Flutter features into existing native mobile apps.',
        'Worked with local and push notifications on both iOS and Android.',
        'Implemented complex navigation systems, with deep linking support.',
        'Added custom platform-specific features and views.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/figma.png',
      title: 'Figma',
      details: [
        'Implemented complete design systems.',
        'Worked inside several professional-level projects.',
        'Made extensive use of components all around the project.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/firebase.png',
      title: 'Firebase',
      details: [
        'Played with offline data persistence.',
        'Made extensive use of Firestore and all its features.',
        'Worked with custom Firebase Functions using TypeScript.',
        'Implemented push notification support with Firebase Messaging.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/amplitude.png',
      title: 'Amplitude',
      details: [
        'Made user behaviour dictate the app development.',
        'Integrated custom events to monitor feature usage.',
        'Tracked user engagement and retention metrics effectively.',
        'Analyzed data to improve user experience and app performance.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/uco.png',
      title: 'Computer Engineer',
      details: [
        'Created local ML models using Python.',
        'Learned the fundamentals of ML and AI.',
        'Collaborated with local Open Source Group.',
        'Experienced low level programming with C and C++.',
        'Programmed low-level vision systems using OpenCV.',
      ],
    ),
  ];

  static final works = [
    Experience(
      imagePath: 'assets/images/aucorsa.png',
      title: 'Aucorsa GO!',
      subtitle: 'Public transportation app',
      trailing: '2024',
      details: [
        'Developed using Flutter multi-platform framework.',
        'Offers real-time data about public transportation in the city of Cordoba, Spain.',
        'Save your favorite bus stops for quick access.',
        'Powerful search and filter functionality.',
        'Developed as an open-source project available on GitHub.',
      ],
      onTap: () => launchUrlString(PortfolioUrls.aucorsaGoAppStore),
    ),
    const Experience(
      imagePath: 'assets/images/octopus.png',
      title: 'IDEAVI',
      subtitle: 'Museum-centric cultural app',
      trailing: '2020',
      details: [
        'Developed using Flutter multi-platform framework.',
        'Created as a Bachelor Thesis with the University of Cordoba.',
        'Tested with real users in the Museum of Archeology of Cordoba.',
        'Scan QR codes in order to get more details about catalogue pieces.',
        'Implements map navigation and audio guides.',
      ],
    ),
    const Experience(
      imagePath: 'assets/images/phobos.png',
      title: 'Ronald McDonald Foundation',
      subtitle: 'Freelancer',
      trailing: '2020',
      details: [
        'Used Firebase service to store user information.',
        'Developed mobile app and CMS web page using Flutter.',
        'Implemented real-time chat between users of the platform.',
        'Acted as a product manager and managed team of developers.',
        'Used GitHub Actions to deploy web page to Firebase Hosting.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/packages.png',
      title: 'Flutter Packages',
      subtitle: 'Open source libraries',
      trailing: 'Ongoing',
      details: [
        'expand_widget: A package to easily expand and retract widget collections or text.',
        'search_page: A fast and easy way to build custom search experiences in apps.',
        'big_tip: Displays actionable information to users using custom layouts.',
        'adwaita_icons: Contains all icons built for the Adwaita Theme.',
        'row_item: Displays compatibility information using two widgets in a row.',
        'grid_point_4: Implements the 4-point grid system in Flutter.',
      ],
      onTap: () => launchUrlString(PortfolioUrls.flutterPackages),
    ),
    Experience(
      imagePath: 'assets/images/cherry.png',
      title: 'SpaceX GO!',
      subtitle: 'Rocket launch tracker app',
      trailing: '2018',
      details: [
        'Developed using Flutter multi-platform framework.',
        'Built with simplicity and ease of use in mind.',
        'Collects essential information about SpaceX: launches, vehicles, and more.',
        'Offers a great one-handed user experience following Material Design guidelines.',
        'Developed as an open-source project available on GitHub.',
      ],
      onTap: () => launchUrlString(PortfolioUrls.cherryGitHub),
    ),
    Experience(
      imagePath: 'assets/images/hamilton.png',
      title: 'Hamilton',
      subtitle: 'Matrix calculator app',
      trailing: '2017',
      details: [
        'Developed using Java native Android tooling.',
        'Used JAMA algebra library for matrix computations.',
        'Performs over 15 matrix operations in a simple and intuitive way.',
        'Followed Material Design guidelines for a clean and elegant design.',
        'Developed as an open-source project available on GitHub.',
      ],
      onTap: () => launchUrlString(PortfolioUrls.hamiltonGitHub),
    ),
  ];
}
