import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/home/widgets/about_card.dart';
import 'package:portfolio/home/widgets/header_card.dart';
import 'package:portfolio/home/widgets/home_card.dart';
import 'package:portfolio/home/widgets/home_drawer.dart';
import 'package:portfolio/home/widgets/journey_card.dart';
import 'package:portfolio/home/widgets/resume_card.dart';
import 'package:portfolio/home/widgets/section_header.dart';
import 'package:portfolio/utils/extensions/layout_phone_extension.dart';
import 'package:portfolio/utils/personal_info.dart';
import 'package:portfolio/widgets/contact_actions.dart';
import 'package:portfolio/widgets/footer_bar.dart';
import 'package:portfolio/widgets/responsive_layout.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: !context.isLayoutPhone
            ? Row(
                children: [
                  for (final tab in HomeTabs.values)
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).colorScheme.onSurface,
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
      drawer: context.isLayoutPhone
          ? HomeDrawer(
              onNavigationItemTap: _onNavigationItemTap,
            )
          : null,
      body: ResponsiveLayout(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderCard(),
                SectionHeader(
                  key: _workSectionKey,
                  leading: const Icon(Icons.verified_rounded),
                  title: const Text('WORK'),
                ),
                HomeCard(
                  child: SizedBox(
                    width: double.infinity,
                    height: 128,
                    child: Center(
                      child: Text(
                        'Coming soon...',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                ),
                SectionHeader(
                  key: _aboutSectionKey,
                  leading: const Icon(Icons.favorite_rounded),
                  title: const Text('ABOUT'),
                ),
                for (final experience in PersonalInfo.about)
                  AboutCard(experience: experience),
                SectionHeader(
                  key: _resumeSectionKey,
                  leading: const Icon(Icons.history_edu_rounded),
                  title: const Text('RESUME'),
                ),
                const ResumeCard(),
                const JourneyCard(),
              ].separate(16),
            ),
            const FooterBar(),
          ],
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
  work,
  about,
  resume;

  String toNavigationString() => toBeginningOfSentenceCase(name)!;
}
