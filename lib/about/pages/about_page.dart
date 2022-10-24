import 'package:flutter/material.dart';
import 'package:portfolio/home/widgets/home_header.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeHeader(),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'ABOUT',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
        ),
        ...[
          for (final i in List.generate(64, (index) => index))
            Text(i.toString())
        ],
      ],
    );
  }
}