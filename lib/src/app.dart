import 'package:flutter/material.dart';
import 'package:pub_packages/src/common/router/app_router.dart';
import 'package:pub_packages/src/common/widget/material_context.dart';
import 'package:pub_packages/src/feature/favorites/widget/favorites_scope.dart';
import 'package:pub_packages/src/feature/initialization/model/repository_store.dart';
import 'package:pub_packages/src/feature/initialization/widget/repository_scope.dart';
import 'package:pub_packages/src/feature/settings/widget/settings_scope.dart';

/// {@template app}
/// App widget
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({
    required RepositoryStore repositoryStore,
    Key? key,
  })  : _repositoryStore = repositoryStore,
        super(key: key);

  final RepositoryStore _repositoryStore;

  @override
  Widget build(BuildContext context) => RepositoryScope(
        repositoryStore: _repositoryStore,
        child: const SettingsScope(
          child: FavoritesScope(
            child: AppRouter(
              child: MaterialContext(),
            ),
          ),
        ),
      );
} // App
