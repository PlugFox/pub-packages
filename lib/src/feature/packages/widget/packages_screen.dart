import 'package:flutter/material.dart';

/// {@template packages_screen.packages_screen}
/// PackagesScreen widget
/// {@endtemplate}
class PackagesScreen extends StatelessWidget {
  /// {@macro packages_screen.packages_screen}
  const PackagesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Packages'),
        ),
        body: const SafeArea(
          child: Center(
            child: Placeholder(),
          ),
        ),
      );
} // PackagesScreen
