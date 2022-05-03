import 'package:flutter/material.dart';

/// {@template library_screen.library_screen}
/// LibraryScreen widget
/// {@endtemplate}
class PackageScreen extends StatelessWidget {
  /// {@macro library_screen.library_screen}
  const PackageScreen({
    required this.name,
    Key? key,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: const SafeArea(
          child: Center(
            child: Placeholder(),
          ),
        ),
      );
} // LibraryScreen
