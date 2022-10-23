import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/router/app_router.dart';
import 'package:portfolio/utils/app_styles.dart';

class App extends StatelessWidget {
  static final router = AppRouter.initialize();

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp.router(
        title: 'Jesus Rodriguez',
        debugShowCheckedModeBanner: false,
        theme: AppStyles.light,
        darkTheme: AppStyles.dark,
        themeMode: ThemeMode.system,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
