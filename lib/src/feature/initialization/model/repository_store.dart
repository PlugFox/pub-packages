import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';

part 'repository_store.freezed.dart';

@unfreezed
class InitializationProgress with _$InitializationProgress {
  InitializationProgress._();
  factory InitializationProgress({
    @Default('Not initialized') String message,
    @Default(0) int progress,
    List<Package>? packages,
  }) = _InitializationProgress;

  RepositoryStore freeze() => RepositoryStore(
        packages: List<Package>.of(packages!),
      );
}

@freezed
class RepositoryStore with _$RepositoryStore {
  factory RepositoryStore({
    required final List<Package> packages,
  }) = _RepositoryStore;
}
