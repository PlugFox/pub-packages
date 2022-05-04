import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';
import 'package:pub_packages/src/feature/package/widget/package_info.dart';
import 'package:pub_packages/src/feature/package/widget/package_scope.dart';

/// {@template library_screen.library_screen}
/// LibraryScreen widget
/// {@endtemplate}
class PackageScreen extends StatefulWidget {
  /// {@macro library_screen.library_screen}
  const PackageScreen({
    required this.package,
    Key? key,
  }) : super(key: key);

  final Package package;

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  @override
  void initState() {
    FirebaseAnalytics.instance.logViewItem(
      items: <AnalyticsEventItem>[
        AnalyticsEventItem(
          itemId: widget.package.name,
          itemName: widget.package.name,
          itemBrand: 'PlugFox',
        ),
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => PackageScope(
        package: widget.package,
        child: const Scaffold(
          body: PackageInfo(),
        ),
      );
} // LibraryScreen
