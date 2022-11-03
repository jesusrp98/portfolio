import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/home/widgets/home_drawer.dart';
import 'package:portfolio/home/widgets/home_header.dart';
import 'package:portfolio/resume/routes/resume_route.dart';
import 'package:portfolio/widgets/contact_actions.dart';
import 'package:portfolio/widgets/footer_bar.dart';
import 'package:portfolio/widgets/portfolio_app_bar.dart';
import 'package:portfolio/widgets/portfolio_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onNavigationItemTap(BuildContext context, HomeTabs tab) {
    return context.push(ResumeRoute.resumePath);
    // switch (tab) {
    // case HomeTabs.work:
    //   Scrollable.ensureVisible(
    //     wk.currentContext!,
    //     curve: Curves.easeInOutCubic,
    //     duration: Duration(milliseconds: 300),
    //     alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
    //     alignment: 40,
    //   );
    //   break;
    // case HomeTabs.about:
    //   Scrollable.ensureVisible(
    //     ak.currentContext!,
    //     curve: Curves.easeInOutCubic,
    //     duration: Duration(milliseconds: 300),
    //   );
    //   break;
    //   case HomeTabs.resume:
    //     return context.push(ResumeRoute.resumePath);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final isPhoneLayout = context.breakpoint < LayoutBreakpoint.sm;

    return PortfolioScaffold(
      appBar: PortfolioAppBar(
        title: !isPhoneLayout
            ? Row(
                children: [
                  for (final tab in HomeTabs.values)
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).textTheme.button?.color,
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
          ? HomeDrawer(
              onNavigationItemTap: _onNavigationItemTap,
            )
          : null,
      body: SliverList(
        delegate: SliverChildListDelegate(
          [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'ABOUT',
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
              ],
            ),
            const FooterBar(),
          ],
        ),
      ),
    );
  }
}

enum HomeTabs {
  work,
  about,
  resume;

  String toNavigationString() => toBeginningOfSentenceCase(name)!;
}
