import 'package:flutter/material.dart';

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
        ),
        body: SafeArea(
          child: ListView(
            children: const <Widget>[],
          ),
        ),
      );
} // FavoritesScreen
