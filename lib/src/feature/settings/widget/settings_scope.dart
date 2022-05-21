import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:l/l.dart';
import 'package:pub_packages/src/feature/authentication/widget/authentication_scope.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template settings_scope.settings_scope_controller}",
/// SettingsScope controller for SettingsScope widget",
/// {@endtemplate}",
abstract class SettingsScopeController {
  abstract final ValueListenable<ThemeData> themeData;

  void setLightTheme();

  void setDarkTheme();
} // ISettingsScopeController

/// {@template settings_scope.settings_scope}
/// SettingsScope widget
/// {@endtemplate}
class SettingsScope extends StatefulWidget {
  /// {@macro settings_scope.settings_scope}
  const SettingsScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// e.g. `SettingsScope.maybeOf(context)`
  static SettingsScopeController? maybeOf(BuildContext context) {
    final inhW = context.getElementForInheritedWidgetOfExactType<_InheritedSettingsScope>()?.widget;
    return inhW is _InheritedSettingsScope ? inhW.controller : null;
  }

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a _InheritedSettingsScope of the exact type',
        'out_of_scope',
      );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// e.g. `SettingsScope.of(context)`
  static SettingsScopeController of(BuildContext context) => maybeOf(context) ?? _notFoundInheritedWidgetOfExactType();

  @override
  State<SettingsScope> createState() => _SettingsScopeState();
} // SettingsScope

/// State for widget SettingsScope
class _SettingsScopeState extends State<SettingsScope> implements SettingsScopeController {
  static const String _kThemeKey = 'theme';
  late final SharedPreferences _sharedPreferences;
  late final DocumentReference<Map<String, Object?>>? _remoteSettings;
  final ValueNotifier<ThemeData> _themeNotifier = ValueNotifier<ThemeData>(ThemeData.light());

  @override
  ValueListenable<ThemeData> get themeData => _themeNotifier;

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    _sharedPreferences = GetIt.instance<SharedPreferences>();
    final uid = AuthenticationScope.of(context).user?.uid;
    if (uid != null) {
      _remoteSettings =
          GetIt.instance<FirebaseFirestore>().collection('users').doc(uid).collection('settings').doc('latest')
            ..get().then<void>(
              (value) {
                if (!value.exists) return;
                final theme = value.data()?[_kThemeKey] as bool?;
                if (theme == null) return;
                theme ? setLightTheme() : setDarkTheme();
                l.i('Settings restored from firestore');
              },
              onError: l.w,
            );
    } else {
      _remoteSettings = null;
    }
    _restoreTheme();
  }

  @override
  void dispose() {
    _themeNotifier.dispose();
    super.dispose();
  }
  /* #endregion */

  ThemeData _restoreTheme() {
    final theme = _sharedPreferences.getBool(_kThemeKey) ?? ui.window.platformBrightness == ui.Brightness.light;
    return _themeNotifier.value = theme ? ThemeData.light() : ThemeData.dark();
  }

  void _setTheme(ThemeData themeData) {
    _sharedPreferences.setBool(
      _kThemeKey,
      themeData.brightness == Brightness.light,
    );
    _themeNotifier.value = themeData;
    _remoteSettings?.set(<String, Object?>{_kThemeKey: themeData.brightness == Brightness.light});
  }

  @override
  void setLightTheme() => _setTheme(ThemeData.light());

  @override
  void setDarkTheme() => _setTheme(ThemeData.dark());

  @override
  Widget build(BuildContext context) => _InheritedSettingsScope(
        controller: this,
        child: widget.child,
      );
} // _SettingsScopeState

/// Inherited widget for quick access in the element tree
class _InheritedSettingsScope extends InheritedWidget {
  const _InheritedSettingsScope({
    required this.controller,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  final SettingsScopeController controller;

  @override
  bool updateShouldNotify(_InheritedSettingsScope oldWidget) => false;
} // _InheritedSettingsScope
