import 'package:flutter/material.dart';
import 'package:portfolio/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.initialize(context);

    return MaterialApp.router(
      title: 'portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Rubik'),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
