import 'package:flutter/material.dart';
import 'package:portfolio/home/widgets/experience_tile.dart';
import 'package:portfolio/home/widgets/home_card.dart';
import 'package:portfolio/utils/personal_info.dart';

class JourneyCard extends StatelessWidget {
  const JourneyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemCount: PersonalInfo.experience.length,
        itemBuilder: (context, index) => ExperienceTile(
          experience: PersonalInfo.experience[index],
        ),
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Divider(height: 0),
        ),
      ),
    );
  }
}
