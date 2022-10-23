import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/about/pages/about_page.dart';
import 'package:portfolio/widgets/start_scaffold.dart';

class AboutRoute extends GoRoute {
  static const aboutPath = '/about';

  AboutRoute()
      : super(
          path: aboutPath,
          pageBuilder: (context, state) => const MaterialPage(
            key: StartScaffold.pageKey,
            child: StartScaffold(
              selectedTab: StartTabs.about,
              body: AboutPage(),
            ),
          ),
        );
}
