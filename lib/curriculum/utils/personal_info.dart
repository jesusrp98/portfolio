import 'package:portfolio/curriculum/models/experience.dart';

class PersonalInfo {
  const PersonalInfo._();

  static const description =
      'I’m focused on frontend and mobile development. My greatest passions are UX/UI design and the open-source community. Love communicate and collaborate with other people around the globe.';

  static const experience = [
    Experience(
      imagePath: 'assets/images/fave.jpg',
      company: 'Fave',
      position: 'Flutter Developer',
      period: '2022',
      tasks: [
        'Implement complex social media features, like chat and news feed.',
        'Worked with CI/CD systems, like Codemagic and Fastlane.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/reflectly.jpg',
      company: 'Reflectly',
      position: 'Flutter Developer',
      period: '2021',
      tasks: [
        'Develop delighting new features in Flutter, focused on user experience and design.',
        'Research user data with Amplitude analytics.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/eyeem.jpg',
      company: 'EyeEm',
      position: 'Flutter Developer',
      period: '2020 - 2021',
      tasks: [
        'Develop new features in Flutter & deploy them to existing native mobile apps.',
        'Manage app releases through production channels.',
      ],
    ),
    Experience(
      imagePath: 'assets/images/wealize.png',
      company: 'Wealize',
      position: 'Software Developer',
      period: '2020',
      tasks: [
        'Worked on IBM Watson-based NLP systems.',
        'Developed React-based frontend for chatbot management system.',
      ],
    ),
  ];
}
