import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/home/widgets/experience_tile.dart';
import 'package:portfolio/home/widgets/home_card.dart';
import 'package:portfolio/utils/extensions/separate_with_extension.dart';
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
              leadingBuilder: (context, imagePath) => SizedBox.square(
                dimension: 48,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Theme.of(context).brightness == Brightness.light
                        ? Border.all(color: Colors.black12, width: 2)
                        : null,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SvgPicture.asset(imagePath),
                  ),
                ),
              ),
            ),
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
