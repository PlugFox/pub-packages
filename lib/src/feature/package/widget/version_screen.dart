import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';
import 'package:pub_packages/src/feature/package/model/version.dart';
import 'package:pub_packages/src/feature/package/widget/package_scope.dart';

final DateFormat _dateFormater = DateFormat.yMMMEd();

/// {@template version_screen.version_screen}
/// VersionScreen widget
/// {@endtemplate}
class VersionScreen extends StatelessWidget {
  /// {@macro version_screen.version_screen}
  const VersionScreen({
    required this.package,
    required this.version,
    Key? key,
  }) : super(key: key);

  final Package package;
  final Version version;

  @override
  Widget build(BuildContext context) => PackageScope(
        package: package,
        child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Text(package.name),
                centerTitle: true,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          package.name,
                          style: Theme.of(context).textTheme.headline5,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 4),
                        Text('Version: ${version.version}'),
                        Text('Published: ${_dateFormater.format(version.published)}'),
                        Text('SDK: ${version.pubspec.environment?.sdk ?? ''}'),
                        const Divider(),
                        Text(version.pubspec.description ?? ''),
                        const Divider(),
                      ],
                    ),
                  ),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 24,
                delegate: SliverChildListDelegate.fixed(
                  <String?>[version.pubspec.homepage, version.pubspec.repository, version.pubspec.issueTracker]
                      .whereType<String>()
                      .map<Widget>(Text.new)
                      .map<Widget>((e) => Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: e))
                      .toList(growable: false),
                ),
              )
            ],
          ),
        ),
      );
} // VersionScreen
