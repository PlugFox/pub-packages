import 'package:flutter/material.dart';
import 'package:pub_packages/src/common/router/routes.dart';
import 'package:pub_packages/src/feature/initialization/widget/repository_scope.dart';

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
        body: SafeArea(
          child: Center(
            child: Builder(
              builder: (context) {
                final repositoryStore = RepositoryScope.of(context);
                final packages = repositoryStore.packages;
                return ListView.separated(
                  itemCount: packages.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) => ListTile(
                    title: Text(packages[index].name ?? 'Unknown'),
                    onTap: () => PackageRoute(name: packages[index].name ?? 'Unknown').go(context),
                  ),
                );
              },
            ),
          ),
        ),
      );
} // PackagesScreen
