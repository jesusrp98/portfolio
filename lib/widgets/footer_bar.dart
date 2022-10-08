import 'package:flutter/material.dart';
import 'package:portfolio/utils/urls.dart';
import 'package:portfolio/widgets/contact_actions.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(16).copyWith(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).textTheme.button?.color,
                ),
                onPressed: () => launchUrlString(Urls.portfolioGitHubPage),
                icon: const Icon(Icons.launch_rounded),
                label: const Text('This page is open source!'),
              ),
              const ContactActions(),
            ],
          ),
        ),
      ],
    );
  }
}
