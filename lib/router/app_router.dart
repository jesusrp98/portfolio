import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/curriculum/routes/curriculum_route.dart';

class AppRouter {
  static GoRouter initialize(BuildContext context) => GoRouter(
        initialLocation: CurriculumRoute.curriculumPath,
        routes: [
          CurriculumRoute(),
        ],
      );
}
