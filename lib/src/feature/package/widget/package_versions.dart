import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pub_packages/src/common/router/routes.dart';
import 'package:pub_packages/src/feature/package/widget/package_scope.dart';

final DateFormat _dateFormater = DateFormat.yMMMEd();

/// {@template package_versions.package_versions}
/// PackageVersions widget
/// {@endtemplate}
class PackageVersions extends StatelessWidget {
  /// {@macro package_versions.package_versions}
  const PackageVersions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverList(
        delegate: SliverChildListDelegate.fixed(
          ListTile.divideTiles(
            context: context,
            tiles: PackageScope.of(context).versions.map<Widget>(
                  (e) => ListTile(
                    leading: Chip(
                      label: Text(
                        e.version,
                      ),
                    ),
                    trailing: Text(_dateFormater.format(e.publishedDate)),
                    onTap: () => VersionRoute(
                      name: PackageScope.of(context).name,
                      version: e.version,
                    ).go(context),
                  ),
                ),
          ).toList(growable: false),
        ),
      );
} // PackageVersions
