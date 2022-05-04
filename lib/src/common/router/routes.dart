import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:pub_packages/src/feature/authentication/widget/authentication_screen.dart';
import 'package:pub_packages/src/feature/favorites/widget/favorites_screen.dart';
import 'package:pub_packages/src/feature/home/widget/home_screen.dart';
import 'package:pub_packages/src/feature/initialization/widget/repository_scope.dart';
import 'package:pub_packages/src/feature/not_found/widget/not_found_screen.dart';
import 'package:pub_packages/src/feature/package/widget/package_screen.dart';
import 'package:pub_packages/src/feature/package/widget/version_screen.dart';
import 'package:pub_packages/src/feature/packages/widget/packages_screen.dart';
import 'package:pub_packages/src/feature/settings/widget/settings_screen.dart';

part 'routes.g.dart';

/// HomeRoute
@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<SettingsRoute>(
      path: 'settings',
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
    TypedGoRoute<FavoritesRoute>(
      path: 'favorites',
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
  PackagesRoute();

  @override
  Widget build(BuildContext context) => const PackagesScreen();
}

/// PackageRoute
@internal
class PackageRoute extends GoRouteData {
  PackageRoute({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final package = RepositoryScope.of(context).packages.firstWhereOrNull((e) => e.name == name);
    if (package == null) {
      return const NotFoundScreen();
    }
    return PackageScreen(package: package);
  }
}

/// VersionRoute
@internal
class VersionRoute extends GoRouteData {
  VersionRoute({required this.name, required this.version});

  final String name;
  final String version;

  @override
  Widget build(BuildContext context) {
    final pck = RepositoryScope.of(context).packages.firstWhereOrNull((e) => e.name == name);
    final ver = pck?.versions.firstWhereOrNull((e) => e.version == version);
    if (pck == null || ver == null) return const NotFoundScreen();
    return VersionScreen(package: pck, version: ver);
  }
}

/// FavoritesRoute
@internal
class FavoritesRoute extends GoRouteData {
  FavoritesRoute();

  @override
  Widget build(BuildContext context) => const FavoritesScreen();
}

/// SettingsRoute
@internal
class SettingsRoute extends GoRouteData {
  SettingsRoute();

  @override
  Widget build(BuildContext context) => const SettingsScreen();
}

/// NotFoundRoute
class NotFoundRoute extends GoRouteData {
  NotFoundRoute({this.exception});

  final Exception? exception;

  @override
  Widget build(BuildContext context) => NotFoundScreen(exception: exception);
}
