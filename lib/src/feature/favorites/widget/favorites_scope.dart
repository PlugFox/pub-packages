import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pub_packages/src/common/util/show_snackbar.dart';
import 'package:pub_packages/src/feature/favorites/bloc/favorites_bloc.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';
import 'package:pub_packages/src/feature/packages/widget/packages_scope.dart';

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

  static void fetchOf(BuildContext context, {bool force = false}) =>
      BlocProvider.of<FavoritesBLoC>(context, listen: false).add(FavoritesEvent.fetch(force: force));

  static void toggleOf(BuildContext context, {required String packageName}) =>
      BlocProvider.of<FavoritesBLoC>(context, listen: false).add(FavoritesEvent.toggle(packageName));

  static List<Package> favoritesOf(
    BuildContext context, {
    bool listen = false,
  }) {
    final packages = PackagesScope.packagesOf(context, listen: listen);
    return BlocProvider.of<FavoritesBLoC>(context, listen: listen).state.favorites.fold(
      <Package>[],
      (list, element) {
        for (final package in packages) {
          if (package.name == element) {
            list.add(package);
            return list;
          }
        }
        return list;
      },
    );
  }

  @override
  State<FavoritesScope> createState() => _FavoritesScopeState();
} // FavoritesScope

/// State for widget FavoritesScope
class _FavoritesScopeState extends State<FavoritesScope> {
  StreamSubscription<User?>? _userSubscription;
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // ignore: close_sinks
    final bloc = BlocProvider.of<FavoritesBLoC>(context)..add(const FavoritesEvent.fetch(force: true));
    GetIt.instance<FirebaseAuth>().userChanges().listen((user) {
      bloc.add(const FavoritesEvent.fetch(force: true));
    });
  }

  @override
  void dispose() {
    _userSubscription?.cancel();
    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) => BlocListener<FavoritesBLoC, FavoritesState>(
        listener: (context, state) => state.mapOrNull<void>(
          successfulToggled: (state) => showSnackBar(
            SnackBar(
              content: Text(
                state.isFavorite
                    ? 'Added "${state.packageName}" to favorites'
                    : 'Removed "${state.packageName}" from favorites',
              ),
            ),
          ),
          error: (state) => showSnackBar(
            const SnackBar(
              content: Text('An error occurred'),
              backgroundColor: Colors.red,
            ),
          ),
        ),
        child: widget.child,
      );
} // _FavoritesScopeState
