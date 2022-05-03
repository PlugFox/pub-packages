import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pub_packages/src/common/router/routes.dart';

/// App router controller
abstract class IAppRouterController {
  /// App router
  abstract final GoRouter router;
}

/// {@template app_router.app_router}
/// AppRouter widget
/// {@endtemplate}
class AppRouter extends StatefulWidget {
  /// {@macro app_router.app_router}
  const AppRouter({
    required this.child,
    Key? key,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// e.g. `AppRouter.maybeOf(context)`
  static IAppRouterController? maybeOf(BuildContext context) {
    final inhW = context
        .getElementForInheritedWidgetOfExactType<_InheritedAppRouter>()
        ?.widget;
    return inhW is _InheritedAppRouter ? inhW.controller : null;
  }

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a _InheritedAppRouter of the exact type',
        'out_of_scope',
      );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// e.g. `AppRouter.of(context)`
  static IAppRouterController of(BuildContext context) =>
      maybeOf(context) ?? _notFoundInheritedWidgetOfExactType();

  @override
  State<AppRouter> createState() => _AppRouterState();
} // AppRouter

/// State for widget AppRouter
class _AppRouterState extends State<AppRouter> with AppRouterController {
  @override
  Widget build(BuildContext context) => _InheritedAppRouter(
        controller: this,
        child: widget.child,
      );
} // _AppRouterState

/// Controller for widget AppRouter
mixin AppRouterController implements IAppRouterController {
  @override
  final GoRouter router = GoRouter(
    initialLocation: const HomeRoute().location,
    routes: $appRoutes,
    errorBuilder: (context, state) =>
        NotFoundRoute(exception: state.error).build(context),
    //redirect: (state) => ,
  );
} // AppRouterController

/// {@template app_router.inherited_app_router}
/// _InheritedAppRouter widget
/// {@endtemplate}
class _InheritedAppRouter extends InheritedWidget {
  /// {@macro app_router.inherited_app_router}
  const _InheritedAppRouter({
    required Widget child,
    required this.controller,
    Key? key,
  }) : super(key: key, child: child);

  final AppRouterController controller;

  @override
  bool updateShouldNotify(_InheritedAppRouter oldWidget) => false;
} // _InheritedAppRouter
