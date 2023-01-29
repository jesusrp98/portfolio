import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:portfolio/utils/extensions/layout_phone_extension.dart';
import 'package:portfolio/utils/portfolio_urls.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GridSpacing.s16),
      child: Flex(
        direction: context.isLayoutPhone ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onBackground,
            ),
            onPressed: () => launchUrlString(PortfolioUrls.portfolioGitHubPage),
            icon: const Icon(Icons.launch_rounded),
            label: const Text('This page is open source!'),
          ),
          if (context.isLayoutPhone) GridSpacing.gap12,
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).textTheme.labelLarge?.color,
            ),
            onPressed: () => launchUrlString(PortfolioUrls.flutterPage),
            icon: const Icon(
              Icons.favorite_rounded,
              color: Colors.blue,
            ),
            label: const Text('Made with Flutter'),
          ),
        ],
      ),
    );
  }
}
