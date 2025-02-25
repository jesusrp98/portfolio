import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:layout/layout.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:portfolio/utils/portfolio_urls.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final axis = context.layout.value(
      md: Axis.horizontal,
      xs: Axis.vertical,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GridSpacing.s16),
      child: Flex(
        direction: axis,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: GridSpacing.s12,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onSurface,
              iconColor: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () => launchUrlString(PortfolioUrls.portfolioGitHubPage),
            icon: const Icon(Symbols.launch_rounded),
            label: const Text('This page is open source!'),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).textTheme.labelLarge?.color,
            ),
            onPressed: () => launchUrlString(PortfolioUrls.flutterPage),
            icon: const FlutterLogo(),
            label: const Text('Made with Flutter'),
          ),
        ],
      ),
    );
  }
}
