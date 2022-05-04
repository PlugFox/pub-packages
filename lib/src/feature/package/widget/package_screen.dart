import 'package:flutter/material.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';
import 'package:pub_packages/src/feature/package/widget/package_info.dart';
import 'package:pub_packages/src/feature/package/widget/package_scope.dart';

/// {@template library_screen.library_screen}
/// LibraryScreen widget
/// {@endtemplate}
class PackageScreen extends StatelessWidget {
  /// {@macro library_screen.library_screen}
  const PackageScreen({
    required this.package,
    Key? key,
  }) : super(key: key);

  final Package package;

  @override
  Widget build(BuildContext context) => PackageScope(
        package: package,
        child: const Scaffold(
          body: PackageInfo(),
        ),
      );
} // LibraryScreen
