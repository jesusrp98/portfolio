import 'package:go_router/go_router.dart';
import 'package:portfolio/about/routes/about_route.dart';
import 'package:portfolio/home/routes/home_route.dart';
import 'package:portfolio/resume/routes/resume_route.dart';

class AppRouter {
  static GoRouter initialize() => GoRouter(
        routes: [
          HomeRoute(),
          AboutRoute(),
          ResumeRoute(),
        ],
      );
}
