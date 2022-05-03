import 'package:flutter/material.dart';
import 'package:pub_packages/src/common/router/app_router.dart';
import 'package:pub_packages/src/common/widget/material_context.dart';

/// {@template app}
/// App widget
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const AppRouter(
        child: MaterialContext(),
      );
} // App
