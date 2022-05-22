// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_analytics/firebase_analytics.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:flutter/material.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pub_packages/src/common/initialization/registered_modules.dart'
    as _i11;
import 'package:pub_packages/src/feature/favorites/data/favorites_repository.dart'
    as _i7;
import 'package:pub_packages/src/feature/packages/data/packages_cache.dart'
    as _i8;
import 'package:pub_packages/src/feature/packages/data/packages_repository.dart'
    as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

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
    gh.factory<_i3.FirebaseAnalytics>(
        () => registeredModules.firebaseAnalytics);
    gh.factory<_i4.FirebaseAuth>(
        () => registeredModules.firebaseAuthentication);
    gh.factory<_i5.FirebaseFirestore>(
        () => registeredModules.firebaseFirestore);
    gh.factory<_i6.GlobalKey<_i6.ScaffoldMessengerState>>(
        () => registeredModules.scaffoldMessengerKey);
    gh.singleton<_i7.IFavoritesRepository>(
        _i7.FavoritesRepositoryImpl(firestore: get<_i5.FirebaseFirestore>()));
    gh.singletonAsync<_i8.IPackagesCache>(() => _i8.PackagesCache.getInstance(),
        registerFor: {_development, _staging, _production});
    gh.singletonAsync<_i8.IPackagesCache>(
        () => _i8.PackagesCacheFake.getInstance(),
        registerFor: {_integration});
    gh.singletonAsync<_i9.IPackagesRepository>(() async =>
        _i9.PackagesRepositoryImpl(
            cache: await getAsync<_i8.IPackagesCache>()));
    await gh.factoryAsync<_i10.SharedPreferences>(
        () => registeredModules.sharedPreferences,
        preResolve: true);
    return this;
  }
}

class _$RegisteredModules extends _i11.RegisteredModules {}
