import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:pub_packages/src/feature/initialization/widget/repository_scope.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template favorites_scope.favorites_scope_controller}",
/// FavoritesScope controller for FavoritesScope widget",
/// {@endtemplate}",
abstract class FavoritesScopeController {
  abstract final ValueListenable<List<Package>> favorites;

  bool getPackageState(String packageName);

  Future<bool> togglePackageState(String packageName);
} // IFavoritesScopeController

/// {@template favorites_scope.favorites_scope}
/// FavoritesScope widget
/// {@endtemplate}
class FavoritesScope extends StatefulWidget {
  /// {@macro favorites_scope.favorites_scope}
  const FavoritesScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// e.g. `FavoritesScope.maybeOf(context)`
  static FavoritesScopeController? maybeOf(BuildContext context) {
    final inhW = context.getElementForInheritedWidgetOfExactType<_InheritedFavoritesScope>()?.widget;
    return inhW is _InheritedFavoritesScope ? inhW.controller : null;
  }

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a _InheritedFavoritesScope of the exact type',
        'out_of_scope',
      );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// e.g. `FavoritesScope.of(context)`
  static FavoritesScopeController of(BuildContext context) => maybeOf(context) ?? _notFoundInheritedWidgetOfExactType();

  @override
  State<FavoritesScope> createState() => _FavoritesScopeState();
} // FavoritesScope

/// State for widget FavoritesScope
class _FavoritesScopeState extends State<FavoritesScope> implements FavoritesScopeController {
  static const String _kFavorites = 'favorites';
  late final List<Package> _packages;
  late final SharedPreferences _sharedPreferences;
  final ValueNotifier<List<Package>> _notifier = ValueNotifier<List<Package>>(<Package>[]);

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    _sharedPreferences = RepositoryScope.of(context).sharedPreferences;
    _packages = RepositoryScope.of(context).packages;
    _updateNotifier();
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }
  /* #endregion */

  @override
  ValueListenable<List<Package>> get favorites => _notifier;

  @override
  bool getPackageState(String packageName) =>
      _sharedPreferences.getStringList(_kFavorites)?.contains(packageName) ?? false;

  @override
  Future<bool> togglePackageState(String packageName) {
    final list = _sharedPreferences.getStringList(_kFavorites) ?? <String>[];
    final bool isFavorite;
    if (list.contains(packageName)) {
      list.remove(packageName);
      isFavorite = false;
    } else {
      list.add(packageName);
      isFavorite = true;
    }
    return _sharedPreferences.setStringList(_kFavorites, list).then<bool>((_) {
      _updateNotifier();
      return isFavorite;
    });
  }

  void _updateNotifier() {
    final newList = _sharedPreferences
            .getStringList(_kFavorites)
            ?.map<Package?>((name) => _packages.firstWhereOrNull((package) => package.name == name))
            .whereType<Package>()
            .toList() ??
        <Package>[];
    if (listEquals(_notifier.value, newList)) return;
    _notifier.value = newList;
  }

  @override
  Widget build(BuildContext context) => _InheritedFavoritesScope(
        controller: this,
        child: widget.child,
      );
} // _FavoritesScopeState

/// Inherited widget for quick access in the element tree
class _InheritedFavoritesScope extends InheritedWidget {
  const _InheritedFavoritesScope({
    required this.controller,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  final FavoritesScopeController controller;

  @override
  bool updateShouldNotify(_InheritedFavoritesScope oldWidget) => false;
} // _InheritedFavoritesScope
