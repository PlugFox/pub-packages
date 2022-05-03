import 'package:flutter/material.dart';

/// {@template settings_screen.settings_screen}
/// SettingsScreen widget
/// {@endtemplate}
class SettingsScreen extends StatelessWidget {
  /// {@macro settings_screen.settings_screen}
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: const SafeArea(
          child: Center(
            child: Placeholder(),
          ),
        ),
      );
} // SettingsScreen
