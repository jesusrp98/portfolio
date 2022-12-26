import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/home/widgets/about_card.dart';
import 'package:portfolio/home/widgets/header_card.dart';
import 'package:portfolio/home/widgets/home_drawer.dart';
import 'package:portfolio/home/widgets/journey_card.dart';
import 'package:portfolio/home/widgets/resume_card.dart';
import 'package:portfolio/home/widgets/section_header.dart';
import 'package:portfolio/utils/personal_info.dart';
import 'package:portfolio/widgets/contact_actions.dart';
import 'package:portfolio/widgets/footer_bar.dart';
import 'package:portfolio/widgets/portfolio_app_bar.dart';
import 'package:portfolio/widgets/portfolio_scaffold.dart';
import 'package:portfolio/widgets/responsive_sliver_layout.dart';

class HomePage extends StatelessWidget {
  static final _workSectionKey = GlobalKey();
  static final _aboutSectionKey = GlobalKey();
  static final _resumeSectionKey = GlobalKey();

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
        child: SliverToBoxAdapter(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderCard(),
                  // SectionHeader(
                  //   key: _workSectionKey,
                  //   leading: const Icon(Icons.verified_rounded),
                  //   title: const Text('WORK'),
                  // ),

                  SectionHeader(
                    key: _resumeSectionKey,
                    leading: const Icon(Icons.history_edu_rounded),
                    title: const Text('RESUME'),
                  ),
                  const ResumeCard(),
                  const JourneyCard(),
                  SectionHeader(
                    key: _aboutSectionKey,
                    leading: const Icon(Icons.favorite_rounded),
                    title: const Text('ABOUT'),
                  ),
                  for (final experience in PersonalInfo.about)
                    AboutCard(experience: experience),
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
      //   case HomeTabs.work:
      //     Scrollable.ensureVisible(
      //       _workSectionKey.currentContext!,
      //       curve: _kScrollAnimationCurve,
      //       duration: _kScrollAnimationDuration,
      //       alignment: _kScrollAnimationAlignment,
      //     );
      //     break;
      case HomeTabs.about:
        Scrollable.ensureVisible(
          _aboutSectionKey.currentContext!,
          curve: _kScrollAnimationCurve,
          duration: _kScrollAnimationDuration,
          alignment: _kScrollAnimationAlignment,
        );
        break;
      case HomeTabs.resume:
        Scrollable.ensureVisible(
          _resumeSectionKey.currentContext!,
          curve: _kScrollAnimationCurve,
          duration: _kScrollAnimationDuration,
          alignment: _kScrollAnimationAlignment,
        );
    }
  }
}

enum HomeTabs {
  // work,
  resume,
  about;

  String toNavigationString() => toBeginningOfSentenceCase(name)!;
}
