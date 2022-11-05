import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/home/widgets/home_card.dart';
import 'package:portfolio/home/widgets/home_drawer.dart';
import 'package:portfolio/home/widgets/home_header.dart';
import 'package:portfolio/home/widgets/section_header.dart';
import 'package:portfolio/resume/routes/resume_route.dart';
import 'package:portfolio/widgets/contact_actions.dart';
import 'package:portfolio/widgets/footer_bar.dart';
import 'package:portfolio/widgets/portfolio_app_bar.dart';
import 'package:portfolio/widgets/portfolio_scaffold.dart';
import 'package:portfolio/widgets/responsive_sliver_layout.dart';

class HomePage extends StatelessWidget {
  static final _workSectionKey = GlobalKey();
  static final _aboutSectionKey = GlobalKey();

  static const _kScrollAnimationDuration = Duration(milliseconds: 300);
  static const _kScrollAnimationCurve = Curves.easeInOutCubic;
  static const _kScrollAnimationAlignment = 0.015;

  const HomePage({super.key});

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
      body: ResponsiveSliverLayout(
        child: SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeader(),
                  SectionHeader(
                    key: _workSectionKey,
                    leading: const Icon(Icons.verified_rounded),
                    title: Text(
                      HomeTabs.work.toNavigationString().toUpperCase(),
                    ),
                  ),
                  const HomeCard(
                    child: SizedBox(height: 300, width: 1200),
                  ),
                  const HomeCard(
                    child: SizedBox(height: 300, width: 1200),
                  ),
                  const HomeCard(
                    child: SizedBox(height: 300, width: 1200),
                  ),
                  SectionHeader(
                    key: _aboutSectionKey,
                    leading: const Icon(Icons.favorite_rounded),
                    title: Text(
                      HomeTabs.about.toNavigationString().toUpperCase(),
                    ),
                  ),
                  const HomeCard(
                    child: SizedBox(height: 300, width: 1200),
                  ),
                  const HomeCard(
                    child: SizedBox(height: 300, width: 1200),
                  ),
                  const HomeCard(
                    child: SizedBox(height: 300, width: 1200),
                  )
                ].separate(24),
              ),
              const FooterBar(),
            ],
          ),
        ),
      ),
    );
  }

  void _onNavigationItemTap(BuildContext context, HomeTabs tab) {
    switch (tab) {
      case HomeTabs.work:
        Scrollable.ensureVisible(
          _workSectionKey.currentContext!,
          curve: _kScrollAnimationCurve,
          duration: _kScrollAnimationDuration,
          alignment: _kScrollAnimationAlignment,
        );
        break;
      case HomeTabs.about:
        Scrollable.ensureVisible(
          _aboutSectionKey.currentContext!,
          curve: _kScrollAnimationCurve,
          duration: _kScrollAnimationDuration,
          alignment: _kScrollAnimationAlignment,
        );
        break;
      case HomeTabs.resume:
        return context.push(ResumeRoute.resumePath);
    }
  }
}

enum HomeTabs {
  work,
  about,
  resume;

  String toNavigationString() => toBeginningOfSentenceCase(name)!;
}
