import 'package:flutter/material.dart';
import 'package:pub_packages/src/common/router/routes.dart';
import 'package:pub_packages/src/common/widget/logout_button.dart';

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
          title: Text(
            context.findAncestorWidgetOfExactType<MaterialApp>()?.title ?? 'Home',
          ),
          centerTitle: true,
          actions: const <Widget>[
            LogoutButton(),
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
                  onTap: () => SettingsRoute().go(context),
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                ),
                ListTile(
                  onTap: () => ProfileRoute().go(context),
                  leading: const Icon(Icons.manage_accounts),
                  title: const Text('Profile'),
                ),
              ],
            ).toList(growable: false),
          ),
        ),
      );
} // HomeScreen
