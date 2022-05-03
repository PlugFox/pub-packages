import 'package:flutter/material.dart';

/// {@template authentication_screen.authentication_screen}
/// AuthenticationScreen widget
/// {@endtemplate}
class AuthenticationScreen extends StatelessWidget {
  /// {@macro authentication_screen.authentication_screen}
  const AuthenticationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Authentication'),
        ),
        body: const SafeArea(
          child: Center(
            child: Placeholder(),
          ),
        ),
      );
} // AuthenticationScreen
