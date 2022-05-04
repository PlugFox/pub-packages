// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $homeRoute,
      $authenticationRoute,
    ];

GoRoute get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'settings',
          factory: $SettingsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'packages',
          factory: $PackagesRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'package/:name',
              factory: $PackageRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'version/:version',
                  factory: $VersionRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'favorites',
          factory: $FavoritesRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext buildContext) => buildContext.go(location, extra: this);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext buildContext) => buildContext.go(location, extra: this);
}

extension $PackagesRouteExtension on PackagesRoute {
  static PackagesRoute _fromState(GoRouterState state) => PackagesRoute();

  String get location => GoRouteData.$location(
        '/packages',
      );

  void go(BuildContext buildContext) => buildContext.go(location, extra: this);
}

extension $PackageRouteExtension on PackageRoute {
  static PackageRoute _fromState(GoRouterState state) => PackageRoute(
        name: state.params['name']!,
      );

  String get location => GoRouteData.$location(
        '/packages/package/${Uri.encodeComponent(name)}',
      );

  void go(BuildContext buildContext) => buildContext.go(location, extra: this);
}

extension $VersionRouteExtension on VersionRoute {
  static VersionRoute _fromState(GoRouterState state) => VersionRoute(
        name: state.params['name']!,
        version: state.params['version']!,
      );

  String get location => GoRouteData.$location(
        '/packages/package/${Uri.encodeComponent(name)}/version/${Uri.encodeComponent(version)}',
      );

  void go(BuildContext buildContext) => buildContext.go(location, extra: this);
}

extension $FavoritesRouteExtension on FavoritesRoute {
  static FavoritesRoute _fromState(GoRouterState state) => FavoritesRoute();

  String get location => GoRouteData.$location(
        '/favorites',
      );

  void go(BuildContext buildContext) => buildContext.go(location, extra: this);
}

GoRoute get $authenticationRoute => GoRouteData.$route(
      path: '/authentication',
      factory: $AuthenticationRouteExtension._fromState,
    );

extension $AuthenticationRouteExtension on AuthenticationRoute {
  static AuthenticationRoute _fromState(GoRouterState state) =>
      AuthenticationRoute();

  String get location => GoRouteData.$location(
        '/authentication',
      );

  void go(BuildContext buildContext) => buildContext.go(location, extra: this);
}
