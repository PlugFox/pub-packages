import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:l/l.dart';
import 'package:pub_packages/src/common/constant/assets.gen.dart';
import 'package:pub_packages/src/common/constant/environments.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';

/// {@template packages_cache}
/// Packages cache storage
/// {@endtemplate}
// ignore: one_member_abstracts
abstract class IPackagesCache {
  /// Get packages from list
  List<Package> getPackages();
} // IPackagesCache

/// {@macro packages_cache}

@Singleton(
  as: IPackagesCache,
  env: <String>[
    Environments.development,
    Environments.staging,
    Environments.production,
  ],
)
class PackagesCache implements IPackagesCache {
  PackagesCache._([this._packages = const <Package>[]]);

  @factoryMethod
  static Future<IPackagesCache> getInstance() async {
    l.d('PackagesCache.getInstance');
    final packages = await _getPackagesFromAssets();
    l.d(' * PackagesCache: ${packages.length} packages loaded');
    return PackagesCache._(packages);
  }

  final List<Package> _packages;

  @override
  List<Package> getPackages() => _packages;

  static Future<List<Package>> _getPackagesFromAssets() async {
    final json = await rootBundle.loadString(Assets.packages);
    return compute<String, List<Package>>(_decode, json);
  }

  static List<Package> _decode(String json) {
    final decoded = jsonDecode(json) as List<Object?>;
    final packages = decoded.cast<Map<String, Object?>>().map<Package>(Package.fromJson).toList(growable: false);
    return packages
        .map<Package>(
          (e) => e..versions.sort((a, b) => b.published.compareTo(a.published)),
        )
        .toList(growable: false);
  }
}

@Singleton(
  as: IPackagesCache,
  env: <String>[
    Environments.integration,
  ],
)
class PackagesCacheFake implements IPackagesCache {
  PackagesCacheFake._();

  @override
  List<Package> getPackages() => <Package>[];

  @factoryMethod
  static Future<IPackagesCache> getInstance() => Future<IPackagesCache>.value(PackagesCacheFake._());
}
