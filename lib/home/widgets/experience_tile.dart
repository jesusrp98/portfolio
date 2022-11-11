import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/home/models/experience.dart';
import 'package:portfolio/home/widgets/details_tag.dart';

class ExperienceTile extends StatelessWidget {
  final Experience experience;

  const ExperienceTile({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    foregroundImage: AssetImage(experience.imagePath),
                    radius: 24,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: AutoSizeText(
                            experience.company.toUpperCase(),
                            maxLines: 2,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text(
                          experience.position,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.caption?.color,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                ].separate(16),
              ),
            ),
            if (context.breakpoint != LayoutBreakpoint.xs)
              DetailsTag(
                child: Text(experience.period),
              ),
          ],
        ),
        for (final task in experience.tasks)
          Text(
            '· $task',
            style: TextStyle(
              color: Theme.of(context).textTheme.caption?.color,
              fontSize: 16,
            ),
          )
      ].separate(8),
    );
  }
}
