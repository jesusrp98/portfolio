import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:portfolio/flutter_packages/cubits/flutter_packages_cubit.dart';
import 'package:portfolio/flutter_packages/cubits/flutter_packages_state.dart';
import 'package:portfolio/flutter_packages/widgets/flutter_package_tile.dart';
import 'package:portfolio/home/widgets/flutter_packages_card.dart';
import 'package:portfolio/home/widgets/home_card.dart';
import 'package:portfolio/home/widgets/work_card.dart';
import 'package:portfolio/utils/personal_info.dart';
import 'package:portfolio/widgets/contact_actions.dart';
import 'package:portfolio/widgets/footer_bar.dart';
import 'package:portfolio/widgets/responsive_layout.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FlutterPackagesPage extends StatefulWidget {
  const FlutterPackagesPage({super.key});

  @override
  State<FlutterPackagesPage> createState() => _FlutterPackagesPageState();
}

class _FlutterPackagesPageState extends State<FlutterPackagesPage> {
  @override
  void initState() {
    super.initState();

    if (context.read<FlutterPackagesCubit>().state.packages.isEmpty) {
      context.read<FlutterPackagesCubit>().fetchFlutterPackages();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          ContactActions(),
        ],
      ),
      body: BlocConsumer<FlutterPackagesCubit, FlutterPackagesState>(
        listenWhen: (previous, current) => previous.error != current.error,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
              action: SnackBarAction(
                label: 'RETRY',
                onPressed:
                    context.read<FlutterPackagesCubit>().fetchFlutterPackages,
              ),
            ),
          );
        },
        builder: (context, state) => _FlutterPackagesView(state),
      ),
    );
  }
}

class _FlutterPackagesView extends StatelessWidget {
  final FlutterPackagesState state;

  const _FlutterPackagesView(this.state);

  @override
  Widget build(BuildContext context) {
    if (state.status == FlutterPackagesStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ResponsiveLayout(
      child: Column(
        children: [
          Column(
            children: [
              const WorkCard(
                leading: FlutterPackagesCard(),
                work: PersonalInfo.flutterPackages,
              ),
              for (final package in state.packages)
                HomeCard(
                  padding: EdgeInsets.zero,
                  child: InkWell(
                    onTap: () => launchUrlString(package.url),
                    child: Padding(
                      padding: HomeCard.resolvePadding(context),
                      child: FlutterPackageTile(
                        package: package,
                        example: _getExampleWidget(package.name),
                      ),
                    ),
                  ),
                ),
            ].separateWith(GridSpacing.gap16),
          ),
          const FooterBar(),
        ],
      ),
    );
  }

  Widget? _getExampleWidget(String packageName) {
    switch (packageName) {
      case 'expand_widget':
        return const FlutterLogo();
      case 'search_page':
        return const FlutterLogo();
      case 'row_item':
        return const FlutterLogo();
      case 'big_tip':
        return const FlutterLogo();
      case 'adwaita_icons':
        return const FlutterLogo();
      case 'grid_point_4':
        return const FlutterLogo();
      default:
        return null;
    }
  }
}
