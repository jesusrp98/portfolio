import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:portfolio/home/models/experience.dart';
import 'package:portfolio/home/widgets/experience_tile.dart';
import 'package:portfolio/home/widgets/home_card.dart';

class SkillCard extends StatelessWidget {
  final Experience experience;

  const SkillCard({
    required this.experience,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      child: ExperienceTile(
        experience: experience,
        leadingBuilder: (context, imagePath) => SizedBox.square(
          dimension: GridSpacing.s48,
          child: ClipOval(
            child: ColoredBox(
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(GridSpacing.s8),
                child: Image.asset(imagePath),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
