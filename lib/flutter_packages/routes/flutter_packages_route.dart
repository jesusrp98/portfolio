import 'package:go_router/go_router.dart';
import 'package:portfolio/flutter_packages/pages/flutter_packages_page.dart';

class FlutterPackagesRoute extends GoRoute {
  static const flutterPackagesPath = '/flutter-packages';

  FlutterPackagesRoute()
      : super(
          path: flutterPackagesPath,
          builder: (context, state) => const FlutterPackagesPage(),
        );
}
