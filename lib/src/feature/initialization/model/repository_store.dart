import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'repository_store.freezed.dart';

@unfreezed
class InitializationProgress with _$InitializationProgress {
  InitializationProgress._();
  factory InitializationProgress({
    @Default('Not initialized') String message,
    @Default(0) int progress,
    SharedPreferences? sharedPreferences,
    List<Package>? packages,
  }) = _InitializationProgress;

  RepositoryStore freeze() => RepositoryStore(
        sharedPreferences: sharedPreferences!,
        packages: List<Package>.of(packages!),
      );
}

@freezed
class RepositoryStore with _$RepositoryStore {
  factory RepositoryStore({
    required final SharedPreferences sharedPreferences,
    required final List<Package> packages,
  }) = _RepositoryStore;
}
