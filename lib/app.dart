import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/flutter_packages/cubits/flutter_packages_cubit.dart';
import 'package:portfolio/router/app_router.dart';
import 'package:portfolio/utils/portfolio_theme.dart';
import 'package:pub_api_client/pub_api_client.dart';

class PortfolioApp extends StatelessWidget {
  static final router = AppRouter.initialize();

  final PubClient pubClient;

  const PortfolioApp({
    super.key,
    required this.pubClient,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FlutterPackagesCubit(pubClient),
      child: Layout(
        child: MaterialApp.router(
          title: 'Jesus Rodriguez',
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: PortfolioTheme.from(
            seedColor: Colors.greenAccent,
            brightness: Brightness.light,
          ),
          darkTheme: PortfolioTheme.from(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark,
          ),
        ),
      ),
    );
  }
}
