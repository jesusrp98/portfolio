import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/router/app_router.dart';
import 'package:portfolio/utils/app_styles.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.initialize();

    return Layout(
      child: MaterialApp.router(
        title: 'portfolio',
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
