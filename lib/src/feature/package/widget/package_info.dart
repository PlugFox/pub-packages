import 'package:flutter/material.dart';
import 'package:pub_packages/src/feature/favorites/widget/favorite_button.dart';
import 'package:pub_packages/src/feature/package/widget/package_scope.dart';
import 'package:pub_packages/src/feature/package/widget/package_versions.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

/// {@template package_info.package_info}
/// PackageInfo widget
/// {@endtemplate}
class PackageInfo extends StatelessWidget {
  /// {@macro package_info.package_info}
  const PackageInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(PackageScope.of(context).name),
            centerTitle: true,
            actions: <Widget>[
              FavoriteButton(
                packageName: PackageScope.of(context).name,
              ),
              const SizedBox(width: 12),
            ],
          ),
          const _PackageInfoHeader(),
          const PackageVersions(),
        ],
      );
} // PackageInfo

class _PackageInfoHeader extends StatelessWidget {
  const _PackageInfoHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 14,
            top: 8,
            right: 14,
            bottom: 12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                PackageScope.of(context).name,
                style: Theme.of(context).textTheme.headline5,
                maxLines: 1,
              ),
              const SizedBox(height: 6),
              Text(PackageScope.of(context).latest.pubspec.description ?? ''),
              Center(
                child: ElevatedButton(
                  onPressed: () => launcher.launchUrl(
                    Uri.parse(
                      'https://pub.dev/packages/${PackageScope.of(context).name}',
                    ),
                  ),
                  child: const Text('Open on pub.dev'),
                ),
              ),
            ],
          ),
        ),
      );
} // _PackageInfoHeader
