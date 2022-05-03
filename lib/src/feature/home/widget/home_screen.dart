import 'package:flutter/material.dart';
import 'package:pub_packages/src/common/router/routes.dart';

/// {@template home_screen.home_screen}
/// HomeScreen widget
/// {@endtemplate}
class HomeScreen extends StatelessWidget {
  /// {@macro home_screen.home_screen}
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => SettingsRoute().go(context),
            ),
            const SizedBox(width: 12),
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: ListTile.divideTiles(
              context: context,
              tiles: <Widget>[
                ListTile(
                  onTap: () => PackagesRoute().go(context),
                  leading: const Icon(Icons.library_books),
                  title: const Text('Packages'),
                ),
                ListTile(
                  onTap: () => FavoritesRoute().go(context),
                  leading: const Icon(Icons.favorite),
                  title: const Text('Favorities'),
                ),
              ],
            ).toList(growable: false),
          ),
        ),
      );
} // HomeScreen
