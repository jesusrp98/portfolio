import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:portfolio/home/models/experience.dart';
import 'package:portfolio/home/widgets/home_card.dart';
import 'package:portfolio/widgets/experience_tile.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;

  const ExperienceCard({
    required this.experience,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      child: ExperienceTile(
        experience: experience,
        leadingBuilder: (context, imagePath) => ClipOval(
          child: Image.asset(
            imagePath,
            width: GridSpacing.s48,
          ),
        ),
      ),
    );
  }
}
