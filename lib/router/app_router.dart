import 'package:go_router/go_router.dart';
import 'package:portfolio/home/routes/home_route.dart';

class AppRouter {
  static GoRouter initialize() => GoRouter(
        routes: [
          HomeRoute(),
        ],
      );
}
