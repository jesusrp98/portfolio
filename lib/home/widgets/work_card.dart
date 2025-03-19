import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:layout/layout.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:portfolio/home/models/experience.dart';
import 'package:portfolio/home/widgets/details_tag.dart';
import 'package:portfolio/home/widgets/home_card.dart';

class WorkCard extends StatelessWidget {
  static const _minImageHeight = 256.0;

  final Experience experience;

  const WorkCard({
    required this.experience,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final verticalLayout = context.breakpoint == LayoutBreakpoint.xs;

    return HomeCard(
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          IntrinsicHeight(
            child: Flex(
              direction: verticalLayout ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(GridSpacing.s12),
                  child: ColoredBox(
                    color: Theme.of(context)
                        .colorScheme
                        .secondaryContainer
                        .withValues(alpha: 0.4),
                    child: Image.asset(
                      experience.imagePath,
                      height: _minImageHeight,
                      width: _minImageHeight * 1.3,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: HomeCard.defaultPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                experience.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                            if (experience.trailing != null)
                              DetailsTag(
                                child: Row(
                                  spacing: GridSpacing.s8,
                                  children: [
                                    Text(experience.trailing!),
                                    if (experience.onTap != null)
                                      const Icon(Symbols.launch_rounded),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        GridSpacing.gap4,
                        if (experience.subtitle != null)
                          Text(
                            experience.subtitle!,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.normal),
                          ),
                        if (experience.details.isNotEmpty) ...[
                          GridSpacing.gap16,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: GridSpacing.s8,
                            children: [
                              for (final task in experience.details)
                                Text(
                                  '· $task',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: experience.onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
