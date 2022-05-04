import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

/// {@template authentication_screen.authentication_screen}
/// AuthenticationScreen widget
/// {@endtemplate}
class AuthenticationScreen extends StatelessWidget {
  /// {@macro authentication_screen.authentication_screen}
  const AuthenticationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SignInScreen(
        auth: FirebaseAuth.instance,
        showAuthActionSwitch: false,
        providerConfigs: const <ProviderConfiguration>[
          GoogleProviderConfiguration(
            clientId: '789908936604-5q9bp96ecv8bhe8pr8rcjuelu05lf256.apps.googleusercontent.com',
          ),
        ],
      );
} // AuthenticationScreen
