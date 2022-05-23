import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// {@template authentication_scope.authentication_scope_controller}",
/// AuthenticationScope controller for AuthenticationScope widget",
/// {@endtemplate}",
abstract class AuthenticationScopeController {
  void logout();
  abstract final ValueListenable<User?> authenticationNotifier;
  abstract final User? user;
  abstract final bool loggedIn;
} // IAuthenticationScopeController

/// {@template authentication_scope.authentication_scope}
/// AuthenticationScope widget
/// {@endtemplate}
class AuthenticationScope extends StatefulWidget {
  /// {@macro authentication_scope.authentication_scope}
  const AuthenticationScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// e.g. `AuthenticationScope.maybeOf(context)`
  static AuthenticationScopeController? maybeOf(BuildContext context) {
    final inhW = context.getElementForInheritedWidgetOfExactType<_InheritedAuthenticationScope>()?.widget;
    return inhW is _InheritedAuthenticationScope ? inhW.controller : null;
  }

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a _InheritedAuthenticationScope of the exact type',
        'out_of_scope',
      );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// e.g. `AuthenticationScope.of(context)`
  static AuthenticationScopeController of(BuildContext context) =>
      maybeOf(context) ?? _notFoundInheritedWidgetOfExactType();

  @override
  State<AuthenticationScope> createState() => _AuthenticationScopeState();
} // AuthenticationScope

/// State for widget AuthenticationScope
class _AuthenticationScopeState extends State<AuthenticationScope> implements AuthenticationScopeController {
  late final StreamSubscription<User?> _sub;
  User? _user;
  @override
  User? get user => _user;
  @override
  bool get loggedIn => user != null;
  final ValueNotifier<User?> _authenticationNotifier = ValueNotifier<User?>(null);

  @override
  ValueListenable<User?> get authenticationNotifier => _authenticationNotifier;
  /* #region Lifecycle */

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
    _authenticationNotifier.value = _user;
    _sub = FirebaseAuth.instance.userChanges().listen(
          (user) => setState(
            () {
              _user = user;
              _authenticationNotifier.value = user;
              if (user != null) {
                FirebaseAnalytics.instance.logLogin();
              }
            },
          ),
        );
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
  /* #endregion */

  @override
  void logout() => FirebaseAuth.instance.signOut();

  @override
  Widget build(BuildContext context) => _InheritedAuthenticationScope(
        user: _user,
        controller: this,
        child: widget.child,
      );
} // _AuthenticationScopeState

/// Inherited widget for quick access in the element tree
class _InheritedAuthenticationScope extends InheritedWidget {
  const _InheritedAuthenticationScope({
    required this.user,
    required this.controller,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  final AuthenticationScopeController controller;
  final User? user;

  @override
  bool updateShouldNotify(_InheritedAuthenticationScope oldWidget) => user?.uid != oldWidget.user?.uid;
} // _InheritedAuthenticationScope
