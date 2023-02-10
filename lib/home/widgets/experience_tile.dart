import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
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
    required this.experience,
    required this.leadingBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: leadingBuilder(context, experience.imagePath),
          title: AutoSizeText(
            experience.title,
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: experience.subtitle != null
              ? Text(
                  experience.subtitle!,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.normal),
                )
              : null,
          trailing: experience.trailing != null &&
                  context.breakpoint != LayoutBreakpoint.xs
              ? DetailsTag(
                  child: Text(experience.trailing!),
                )
              : null,
        ),
        for (final task in experience.details)
          Text(
            '· $task',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.normal),
          )
      ].separateWith(GridSpacing.gap8),
    );
  }
}
