import 'package:go_router/go_router.dart';
import 'package:portfolio/home/pages/home_page.dart';

class HomeRoute extends GoRoute {
  static const homeRoute = '/';

  HomeRoute()
      : super(
          path: homeRoute,
          builder: (context, state) => const HomePage(),
        );
}
