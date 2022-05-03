import 'dart:async';

import 'package:flutter/material.dart';

void main() => runZonedGuarded<Future<void>>(() async {
      runApp(const App());
    }, (error, stackTrace) {
      Error.safeToString(error);
      stackTrace.toString();
    });

/// {@template app}
/// App widget
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: const SafeArea(
            child: Center(
              child: Text('Hello World'),
            ),
          ),
        ),
      );
} // App
