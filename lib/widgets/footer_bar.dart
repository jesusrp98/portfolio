import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/utils/urls.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isPhoneLayout = context.breakpoint < LayoutBreakpoint.sm;

    final openSourceButton = TextButton.icon(
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).textTheme.labelLarge?.color,
      ),
      onPressed: () => launchUrlString(Urls.portfolioGitHubPage),
      icon: const Icon(Icons.launch_rounded),
      label: const Text('This page is open source!'),
    );

    final flutterButton = TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).textTheme.labelLarge?.color,
      ),
      onPressed: () => launchUrlString(Urls.flutterPage),
      child: const Text('Made with 💙 Flutter'),
    );

    if (isPhoneLayout) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            openSourceButton,
            flutterButton,
          ].separate(12),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          openSourceButton,
          flutterButton,
        ],
      ),
    );
  }
}
