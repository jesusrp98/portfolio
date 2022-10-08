import 'package:flutter/material.dart';
import 'package:portfolio/widgets/portfolio_app_bar.dart';
import 'package:portfolio/widgets/portfolio_scaffold.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PortfolioScaffold(
      appBar: PortfolioAppBar(
        title: const Text('Jesus Rodriguez'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).textTheme.button?.color,
                  ),
                  onPressed: () => launchUrlString('${Uri.base}resume'),
                  child: const Text('Resume'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Text(index.toString()),
        ),
      ),
    );
  }
}
