import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/about/routes/about_route.dart';
import 'package:portfolio/home/routes/home_route.dart';
import 'package:portfolio/resume/routes/resume_route.dart';
import 'package:portfolio/resume/utils/personal_info.dart';
import 'package:portfolio/widgets/contact_actions.dart';
import 'package:portfolio/widgets/footer_bar.dart';
import 'package:portfolio/widgets/portfolio_app_bar.dart';
import 'package:portfolio/widgets/portfolio_scaffold.dart';

typedef NavigationItemCallback = Function(BuildContext context, StartTabs tab);

class StartScaffold extends StatelessWidget {
  static const pageKey = ValueKey('StartScaffold');

  final Widget body;
  final StartTabs selectedTab;

  const StartScaffold({
    super.key,
    required this.body,
    required this.selectedTab,
  });

  void _onNavigationItemTap(BuildContext context, StartTabs tab) {
    if (tab == selectedTab) return;

    switch (tab) {
      case StartTabs.home:
        return context.go(HomeRoute.homePath);
      case StartTabs.about:
        return context.go(AboutRoute.aboutPath);
      case StartTabs.resume:
        return context.push(ResumeRoute.resumePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPhoneLayout = context.breakpoint < LayoutBreakpoint.sm;

    return PortfolioScaffold(
      appBar: PortfolioAppBar(
        title: !isPhoneLayout
            ? Row(
                children: [
                  for (final tab in StartTabs.values)
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: tab == selectedTab
                            ? Theme.of(context).textTheme.button?.color
                            : Theme.of(context).textTheme.caption?.color,
                      ),
                      onPressed: () => _onNavigationItemTap(context, tab),
                      child: Text(tab.toNavigationString()),
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
      drawer: isPhoneLayout
          ? _StartDrawer(
              selectedTab: selectedTab,
              onNavigationItemTap: _onNavigationItemTap,
            )
          : null,
      body: SliverList(
        delegate: SliverChildListDelegate(
          [
            body,
            const FooterBar(),
          ],
        ),
      ),
    );
  }
}

class _StartDrawer extends StatelessWidget {
  final StartTabs selectedTab;
  final NavigationItemCallback onNavigationItemTap;

  const _StartDrawer({
    required this.selectedTab,
    required this.onNavigationItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16).copyWith(bottom: 12),
            child: Text(
              PersonalInfo.name,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          for (final tab in StartTabs.values)
            ListTile(
              title: Text(
                tab.toNavigationString(),
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: tab != selectedTab
                          ? Theme.of(context).textTheme.caption?.color
                          : null,
                    ),
              ),
              onTap: () {
                onNavigationItemTap(context, tab);
                Navigator.of(context).pop();
              },
            ),
        ],
      ),
    );
  }
}

enum StartTabs {
  home,
  about,
  resume;

  String toNavigationString() => toBeginningOfSentenceCase(name)!;
}
