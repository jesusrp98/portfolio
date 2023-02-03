import 'package:equatable/equatable.dart';
import 'package:pub_api_client/pub_api_client.dart';

class FlutterPackagesState extends Equatable {
  final List<PubPackage> packages;
  final FlutterPackagesStatus status;
  final Exception? error;

  const FlutterPackagesState({
    this.packages = const [],
    this.status = FlutterPackagesStatus.uninitialized,
    this.error,
  });

  FlutterPackagesState copyWith({
    List<PubPackage>? packages,
    FlutterPackagesStatus? status,
    Exception? error,
  }) =>
      FlutterPackagesState(
        packages: packages ?? this.packages,
        status: status ?? this.status,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [
        packages,
        status,
        error,
      ];
}

enum FlutterPackagesStatus { uninitialized, loading, loaded, error }
