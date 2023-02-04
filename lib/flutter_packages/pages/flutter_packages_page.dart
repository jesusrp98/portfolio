import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:portfolio/flutter_packages/cubits/flutter_packages_cubit.dart';
import 'package:portfolio/flutter_packages/cubits/flutter_packages_state.dart';
import 'package:portfolio/flutter_packages/widgets/flutter_package_card.dart';
import 'package:portfolio/home/widgets/flutter_packages_card_leading.dart';
import 'package:portfolio/home/widgets/work_card.dart';
import 'package:portfolio/utils/personal_info.dart';
import 'package:portfolio/widgets/contact_actions.dart';
import 'package:portfolio/widgets/footer_bar.dart';
import 'package:portfolio/widgets/responsive_layout.dart';

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
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
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
                leading: FlutterPackagesCardLeading(),
                work: PersonalInfo.flutterPackages,
              ),
              for (final package in state.packages)
                FlutterPackageCard(
                  leading: _getTileLeading(package.name),
                  package: package,
                ),
            ].separateWith(GridSpacing.gap16),
          ),
          const FooterBar(),
        ],
      ),
    );
  }

  Widget _getTileLeading(String packageName) {
    switch (packageName) {
      case 'expand_widget':
        return const Icon(Icons.expand_more_rounded);
      case 'search_page':
        return const Icon(Icons.search_rounded);
      case 'row_item':
        return const Icon(Icons.list_rounded);
      case 'big_tip':
        return const Icon(Icons.lightbulb_outline_rounded);
      case 'adwaita_icons':
        return const Icon(Icons.interests_rounded);
      case 'grid_point_4':
        return const Icon(Icons.line_weight_rounded);
      default:
        return const Icon(Icons.inventory_2_rounded);
    }
  }
}
