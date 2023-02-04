import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/home/widgets/home_card.dart';
import 'package:pub_api_client/pub_api_client.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FlutterPackageCard extends StatelessWidget {
  final Widget leading;
  final PubPackage package;

  const FlutterPackageCard({
    super.key,
    required this.leading,
    required this.package,
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
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: GridSpacing.s96,
                      minWidth: GridSpacing.s96,
                      minHeight: GridSpacing.s96,
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconTheme.merge(
                        data: IconThemeData(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          size: GridSpacing.s48,
                        ),
                        child: leading,
                      ),
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding: HomeCard.resolvePadding(context),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                package.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                              GridSpacing.gap4,
                              Text(
                                package.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.launch_rounded,
                          color: Theme.of(context).colorScheme.onSurface,
                        )
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
                onTap: () => launchUrlString(package.url),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
