import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/home/models/work.dart';
import 'package:portfolio/home/widgets/details_tag.dart';
import 'package:portfolio/home/widgets/home_card.dart';

class WorkCard extends StatelessWidget {
  static const _minImageHeight = 256.0;

  final Widget leading;
  final Work work;
  final VoidCallback? onTap;

  const WorkCard({
    required this.leading,
    required this.work,
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (context.breakpoint != LayoutBreakpoint.xs)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width / 3)
                          .clamp(0, _minImageHeight * 1.5),
                      height: _minImageHeight,
                      child: leading,
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding: HomeCard.resolvePadding(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    work.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                if (onTap != null)
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    size: GridSpacing.s32,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  )
                              ],
                            ),
                            GridSpacing.gap12,
                            Text(
                              work.subtitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        GridSpacing.gap12,
                        Wrap(
                          spacing: GridSpacing.s12,
                          runSpacing: GridSpacing.s12,
                          children: [
                            for (final tag in work.tags)
                              DetailsTag(
                                child: Text(tag),
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
