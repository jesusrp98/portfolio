import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/home/models/experience.dart';
import 'package:portfolio/home/widgets/details_tag.dart';

typedef LeadingWidgetBuilder = Widget Function(
  BuildContext context,
  String imagePath,
);

class ExperienceTile extends StatelessWidget {
  final Experience experience;
  final LeadingWidgetBuilder leadingBuilder;

  const ExperienceTile({
    super.key,
    required this.experience,
    required this.leadingBuilder,
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
                  leadingBuilder(context, experience.imagePath),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: AutoSizeText(
                            experience.title,
                            maxLines: 2,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        if (experience.subtitle != null)
                          Text(
                            experience.subtitle!,
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
            if (experience.trailing != null &&
                context.breakpoint != LayoutBreakpoint.xs)
              DetailsTag(
                child: Text(experience.trailing!),
              ),
          ],
        ),
        for (final task in experience.details)
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
