import 'package:injectable/injectable.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';
import 'package:pub_packages/src/feature/packages/data/packages_cache.dart';

/// {@template packages_repository}
/// PackagesRepository
/// {@endtemplate}
// ignore: one_member_abstracts
abstract class IPackagesRepository {
  /// Get packages from list
  List<Package> getPackages();
} // PackagesRepository

/// {@macro packages_repository}
@Singleton(as: IPackagesRepository)
class PackagesRepositoryImpl implements IPackagesRepository {
  /// {@macro packages_repository}
  const PackagesRepositoryImpl({required IPackagesCache cache}) : _cache = cache;

  final IPackagesCache _cache;

  @override
  List<Package> getPackages() => _cache.getPackages();
}
