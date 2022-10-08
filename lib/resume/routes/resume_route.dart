import 'package:go_router/go_router.dart';
import 'package:portfolio/resume/pages/resume_page.dart';

class ResumeRoute extends GoRoute {
  static const curriculumPath = '/resume';

  ResumeRoute()
      : super(
          path: curriculumPath,
          builder: (context, state) => const ResumePage(),
        );
}
