import 'package:flutter/material.dart';
import 'package:pub_packages/src/feature/favorites/widget/favorites_scope.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';
import 'package:pub_packages/src/feature/packages/widget/packages_list_view.dart';

/// {@template favorites_screen.favorites_screen}
/// FavoritesScreen widget
/// {@endtemplate}
class FavoritesScreen extends StatelessWidget {
  /// {@macro favorites_screen.favorites_screen}
  const FavoritesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: ValueListenableBuilder<List<Package>>(
              valueListenable: FavoritesScope.of(context).favorites,
              builder: (context, packages, _) => PackagesListView(
                packages: packages,
              ),
            ),
          ),
        ),
      );
} // FavoritesScreen
