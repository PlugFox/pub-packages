import 'package:flutter/material.dart';
import 'package:pub_packages/src/feature/initialization/widget/repository_scope.dart';
import 'package:pub_packages/src/feature/packages/widget/packages_list_view.dart';

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
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: PackagesListView(
              packages: RepositoryScope.of(context).packages,
            ),
          ),
        ),
      );
} // PackagesScreen
