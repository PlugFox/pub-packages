import 'package:flutter/material.dart';

/// {@template repository_scope.repository_scope}
/// RepositoryScope widget
/// {@endtemplate}
class RepositoryScope extends InheritedWidget {
  /// {@macro repository_scope.repository_scope}
  const RepositoryScope({
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(RepositoryScope oldWidget) => false;
} // RepositoryScope
