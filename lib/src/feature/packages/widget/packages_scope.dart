import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';
import 'package:pub_packages/src/feature/packages/bloc/packages_bloc.dart';

/// {@template packages_scope}
/// PackagesScope widget
/// {@endtemplate}
class PackagesScope extends StatelessWidget {
  /// {@macro packages_scope}
  const PackagesScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  static List<Package> packagesOf(
    BuildContext context, {
    bool listen = false,
  }) =>
      BlocProvider.of<PackagesBLoC>(context, listen: listen).state.packages;

  @override
  Widget build(BuildContext context) => child;
} // PackagesScope
