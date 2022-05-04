import 'package:flutter/material.dart';
import 'package:pub_packages/src/common/router/routes.dart';
import 'package:pub_packages/src/feature/favorites/widget/favorite_button.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';

/// {@template packages_list_view.packages_list_view}
/// PackagesListView widget
/// {@endtemplate}
class PackagesListView extends StatelessWidget {
  /// {@macro packages_list_view.packages_list_view}
  const PackagesListView({
    required this.packages,
    Key? key,
  }) : super(key: key);

  final List<Package> packages;

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: packages.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final package = packages[index];
          return ListTile(
            key: ValueKey<String>(package.name),
            title: Text(packages[index].name),
            onTap: () => PackageRoute(name: package.name).go(context),
            trailing: FavoriteButton(packageName: package.name),
          );
        },
      );
} // PackagesListView
