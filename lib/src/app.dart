import 'package:flutter/material.dart';
import 'package:pub_packages/src/common/router/app_router.dart';
import 'package:pub_packages/src/common/widget/global_bloc_provider.dart';
import 'package:pub_packages/src/common/widget/material_context.dart';
import 'package:pub_packages/src/feature/authentication/widget/authentication_scope.dart';
import 'package:pub_packages/src/feature/favorites/widget/favorites_scope.dart';
import 'package:pub_packages/src/feature/packages/widget/packages_scope.dart';
import 'package:pub_packages/src/feature/settings/widget/settings_scope.dart';

/// {@template app}
/// App widget
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const GlobalBlocProvider(
        child: AuthenticationScope(
          child: SettingsScope(
            child: PackagesScope(
              child: FavoritesScope(
                child: AppRouter(
                  child: MaterialContext(),
                ),
              ),
            ),
          ),
        ),
      );
} // App
