import 'package:go_router/go_router.dart';
import 'package:portfolio/curriculum/pages/curriculum_page.dart';

class CurriculumRoute extends GoRoute {
  static const curriculumPath = '/cv';

  CurriculumRoute()
      : super(
          path: curriculumPath,
          builder: (context, state) => const CurriculumPage(),
        );
}
