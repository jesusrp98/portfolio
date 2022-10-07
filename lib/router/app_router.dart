import 'package:go_router/go_router.dart';
import 'package:portfolio/curriculum/routes/curriculum_route.dart';

class AppRouter {
  static GoRouter initialize() => GoRouter(
        initialLocation: CurriculumRoute.curriculumPath,
        routes: [
          CurriculumRoute(),
        ],
      );
}
