// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pub_packages/src/common/data/registered_modules.dart' as _i6;
import 'package:pub_packages/src/feature/packages/data/packages_cache.dart'
    as _i3;
import 'package:pub_packages/src/feature/packages/data/packages_repository.dart'
    as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

const String _development = 'development';
const String _staging = 'staging';
const String _production = 'production';
const String _integration = 'integration';

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  Future<_i1.GetIt> $initGetIt(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    final registeredModules = _$RegisteredModules();
    gh.singletonAsync<_i3.IPackagesCache>(() => _i3.PackagesCache.getInstance(),
        registerFor: {_development, _staging, _production});
    gh.singletonAsync<_i3.IPackagesCache>(
        () => _i3.PackagesCacheFake.getInstance(),
        registerFor: {_integration});
    gh.singletonAsync<_i4.IPackagesRepository>(() async =>
        _i4.PackagesRepositoryImpl(
            cache: await getAsync<_i3.IPackagesCache>()));
    await gh.factoryAsync<_i5.SharedPreferences>(
        () => registeredModules.sharedPreferences,
        preResolve: true);
    return this;
  }
}

class _$RegisteredModules extends _i6.RegisteredModules {}
