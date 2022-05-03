import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:pub_packages/src/feature/authentication/widget/authentication_screen.dart';
import 'package:pub_packages/src/feature/favorites/widget/favorites_screen.dart';
import 'package:pub_packages/src/feature/home/widget/home_screen.dart';
import 'package:pub_packages/src/feature/not_found/widget/not_found_screen.dart';
import 'package:pub_packages/src/feature/package/widget/package_screen.dart';
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
        ),
      ],
    ),
    TypedGoRoute<FavoritesRoute>(
      path: 'favorites',
      routes: <TypedGoRoute<GoRouteData>>[
        TypedGoRoute<FavoriteRoute>(
          path: 'favorite/:name',
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
  Widget build(BuildContext context) => PackageScreen(name: name);
}

/// FavoritesRoute
@internal
class FavoritesRoute extends GoRouteData {
  FavoritesRoute();

  @override
  Widget build(BuildContext context) => const FavoritesScreen();
}

/// FavoriteRoute
@internal
class FavoriteRoute extends GoRouteData {
  FavoriteRoute({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) => PackageScreen(name: name);
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
