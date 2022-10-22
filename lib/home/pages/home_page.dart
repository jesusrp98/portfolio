import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/home/widgets/home_drawer.dart';
import 'package:portfolio/home/widgets/home_header.dart';
import 'package:portfolio/widgets/contact_actions.dart';
import 'package:portfolio/widgets/footer_bar.dart';
import 'package:portfolio/widgets/portfolio_app_bar.dart';
import 'package:portfolio/widgets/portfolio_scaffold.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isPhoneLayout = context.breakpoint < LayoutBreakpoint.sm;

    return PortfolioScaffold(
      appBar: PortfolioAppBar(
        title: !isPhoneLayout
            ? Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Theme.of(context).textTheme.button?.color,
                    ),
                    onPressed: () {},
                    child: const Text('Home'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Theme.of(context).textTheme.button?.color,
                    ),
                    onPressed: () {},
                    child: const Text('About'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Theme.of(context).textTheme.button?.color,
                    ),
                    onPressed: () => launchUrlString('${Uri.base}resume'),
                    child: const Text('Resume'),
                  ),
                ].separate(8),
              )
            : null,
        actions: const [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16),
            child: ContactActions(),
          ),
        ],
      ),
      drawer: isPhoneLayout ? const HomeDrawer() : null,
      body: SliverList(
        delegate: SliverChildListDelegate(
          [
            const HomeHeader(),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'MY WORK',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            ),
            ...[
              for (final i in List.generate(64, (index) => index))
                Text(i.toString())
            ],
            const FooterBar(),
          ],
        ),
      ),
    );
  }
}
