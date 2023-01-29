import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:portfolio/home/widgets/experience_tile.dart';
import 'package:portfolio/home/widgets/home_card.dart';
import 'package:portfolio/utils/personal_info.dart';

class ResumeCard extends StatelessWidget {
  const ResumeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      child: Column(
        children: [
          for (final experience in PersonalInfo.resume)
            ExperienceTile(
              experience: experience,
              leadingBuilder: (context, imagePath) => ClipOval(
                child: Image.asset(
                  imagePath,
                  width: GridSpacing.s48,
                ),
              ),
            ),
        ].separateWith(
          const Padding(
            padding: EdgeInsets.symmetric(vertical: GridSpacing.s16),
            child: Divider(),
          ),
        ),
      ),
    );
  }
}
