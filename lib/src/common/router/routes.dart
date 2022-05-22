import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:pub_packages/src/feature/authentication/widget/authentication_screen.dart';
import 'package:pub_packages/src/feature/home/widget/home_screen.dart';
import 'package:pub_packages/src/feature/not_found/widget/not_found_screen.dart';
import 'package:pub_packages/src/feature/package/widget/package_screen.dart';
import 'package:pub_packages/src/feature/package/widget/version_screen.dart';
import 'package:pub_packages/src/feature/packages/data/packages_repository.dart';
import 'package:pub_packages/src/feature/packages/widget/packages_screen.dart';
import 'package:pub_packages/src/feature/profile/widget/profile_screen.dart';
import 'package:pub_packages/src/feature/settings/widget/settings_screen.dart';

part 'routes.g.dart';

/// HomeRoute
@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<SettingsRoute>(
      path: 'settings',
    ),
    TypedGoRoute<ProfileRoute>(
      path: 'profile',
    ),
    TypedGoRoute<PackagesRoute>(
      path: 'packages',
      routes: <TypedGoRoute<GoRouteData>>[
        TypedGoRoute<PackageRoute>(
          path: 'package/:name',
          routes: <TypedGoRoute<GoRouteData>>[
            TypedGoRoute<VersionRoute>(
              path: 'version/:version',
            ),
          ],
        ),
      ],
    ),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context) => const HomeScreen();
}

/// AuthenticationRoute
@TypedGoRoute<AuthenticationRoute>(path: '/authentication')
class AuthenticationRoute extends GoRouteData {
  AuthenticationRoute();

  @override
  Widget build(BuildContext context) => const AuthenticationScreen();
}

/// PackagesRoute
@internal
class PackagesRoute extends GoRouteData {
  PackagesRoute({this.tab});

  final String? tab;

  @override
  Widget build(BuildContext context) => PackagesScreen(tab: tab);
}

/// PackageRoute
@internal
class PackageRoute extends GoRouteData {
  PackageRoute({
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    final package = GetIt.instance<IPackagesRepository>()
        .getPackages()
        .firstWhereOrNull((e) => e.name == name);
    if (package == null) {
      return const NotFoundScreen();
    }
    return PackageScreen(package: package);
  }
}

/// VersionRoute
@internal
class VersionRoute extends GoRouteData {
  VersionRoute({
    required this.name,
    required this.version,
  });

  final String name;
  final String version;

  @override
  Widget build(BuildContext context) {
    final pck = GetIt.instance<IPackagesRepository>()
        .getPackages()
        .firstWhereOrNull((e) => e.name == name);
    final ver = pck?.versions.firstWhereOrNull((e) => e.version == version);
    if (pck == null || ver == null) return const NotFoundScreen();
    return VersionScreen(package: pck, version: ver);
  }
}

/// SettingsRoute
@internal
class SettingsRoute extends GoRouteData {
  SettingsRoute();

  @override
  Widget build(BuildContext context) => const SettingsScreen();
}

/// ProfileRoute
@internal
class ProfileRoute extends GoRouteData {
  ProfileRoute();

  @override
  Widget build(BuildContext context) => const ProfileScreen();
}

/// NotFoundRoute
@internal
class NotFoundRoute extends GoRouteData {
  NotFoundRoute({this.exception});

  final Exception? exception;

  @override
  Widget build(BuildContext context) => NotFoundScreen(exception: exception);
}
