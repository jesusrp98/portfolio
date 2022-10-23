import 'package:go_router/go_router.dart';
import 'package:portfolio/resume/pages/resume_page.dart';

class ResumeRoute extends GoRoute {
  static const resumePath = '/resume';

  ResumeRoute()
      : super(
          path: resumePath,
          builder: (context, state) => const ResumePage(),
        );
}
