import 'package:flutter/material.dart';
import 'package:portfolio/home/widgets/experience_tile.dart';
import 'package:portfolio/home/widgets/home_card.dart';
import 'package:portfolio/utils/extensions/separate_with_extension.dart';
import 'package:portfolio/utils/personal_info.dart';

class JourneyCard extends StatelessWidget {
  const JourneyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      child: Column(
        children: [
          for (final experience in PersonalInfo.experience)
            ExperienceTile(experience: experience),
        ].separateWith(
          separator: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(),
          ),
        ),
      ),
    );
  }
}
