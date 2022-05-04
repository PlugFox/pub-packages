import 'package:flutter/material.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';

/// {@template package_scope.package_scope}
/// PackageScope widget
/// {@endtemplate}
class PackageScope extends InheritedWidget {
  /// {@macro package_scope.package_scope}
  const PackageScope({
    required this.package,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  final Package package;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// e.g. `Package.maybeOf(context)`
  static Package? maybeOf(BuildContext context, {bool listen = false}) {
    if (listen) {
      return context.dependOnInheritedWidgetOfExactType<PackageScope>()?.package;
    } else {
      final inhW = context.getElementForInheritedWidgetOfExactType<PackageScope>()?.widget;
      return inhW is PackageScope ? inhW.package : null;
    }
  }

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a Package of the exact type',
        'out_of_scope',
      );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// e.g. `Package.of(context)`
  static Package of(BuildContext context, {bool listen = false}) =>
      maybeOf(context, listen: listen) ?? _notFoundInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(PackageScope oldWidget) => package.name != oldWidget.package.name;
} // PackageScope
