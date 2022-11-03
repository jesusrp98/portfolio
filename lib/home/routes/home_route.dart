import 'package:go_router/go_router.dart';
import 'package:portfolio/home/pages/home_page.dart';

class HomeRoute extends GoRoute {
  static const homePath = '/';

  HomeRoute()
      : super(
          path: homePath,
          builder: (context, state) => const HomePage(),
        );
}
