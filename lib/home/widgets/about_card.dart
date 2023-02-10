import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/home/models/experience.dart';
import 'package:portfolio/home/widgets/home_card.dart';

class AboutCard extends StatelessWidget {
  static const _minImageHeight = 164.0;

  final Experience experience;

  const AboutCard({required this.experience, super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: _minImageHeight),
      child: HomeCard(
        padding: EdgeInsets.zero,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (context.breakpoint != LayoutBreakpoint.xs)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    experience.imagePath,
                    width: _minImageHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: HomeCard.resolvePadding(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        experience.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      GridSpacing.gap16,
                      ...[
                        for (final detail in experience.details)
                          Text(
                            detail,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.normal),
                          ),
                      ].separateWith(GridSpacing.gap12),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
