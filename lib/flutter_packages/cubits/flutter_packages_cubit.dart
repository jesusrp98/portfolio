import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/flutter_packages/cubits/flutter_packages_state.dart';
import 'package:pub_api_client/pub_api_client.dart';

class FlutterPackagesCubit extends Cubit<FlutterPackagesState> {
  static const publisherName = 'jesusrp98.page';

  final PubClient client;

  FlutterPackagesCubit(this.client) : super(const FlutterPackagesState());

  Future<void> fetchFlutterPackages() async {
    emit(state.copyWith(status: FlutterPackagesStatus.loading));

    try {
      final packageNames = await client.fetchPublisherPackages(publisherName);
      final result = <PubPackage>[];

      for (final packageName in packageNames) {
        result.add(await client.packageInfo(packageName.package));
      }

      return emit(
        state.copyWith(
          status: FlutterPackagesStatus.loaded,
          packages: result,
        ),
      );
    } on Exception catch (e) {
      return emit(
        state.copyWith(
          status: FlutterPackagesStatus.error,
          error: e,
        ),
      );
    }
  }
}
