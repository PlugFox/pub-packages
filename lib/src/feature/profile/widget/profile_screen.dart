import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart' as flutterfire_ui;

/// {@template profile_screen.profile_screen}
/// ProfileScreen widget
/// {@endtemplate}
class ProfileScreen extends StatelessWidget {
  /// {@macro profile_screen.profile_screen}
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => flutterfire_ui.ProfileScreen(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        providerConfigs: const <flutterfire_ui.ProviderConfiguration>[
          flutterfire_ui.GoogleProviderConfiguration(
            clientId: '789908936604-5q9bp96ecv8bhe8pr8rcjuelu05lf256.apps.googleusercontent.com',
          ),
        ],
      );
} // ProfileScreen
