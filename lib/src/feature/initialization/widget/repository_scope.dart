import 'package:flutter/material.dart';
import 'package:pub_packages/src/feature/initialization/model/repository_store.dart';

/// {@template repository_scope.repository_scope}
/// RepositoryScope widget
/// {@endtemplate}
class RepositoryScope extends InheritedWidget {
  /// {@macro repository_scope.repository_scope}
  const RepositoryScope({
    required this.repositoryStore,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  final RepositoryStore repositoryStore;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// e.g. `RepositoryScope.maybeOf(context)`
  static RepositoryStore? maybeOf(BuildContext context) {
    final inhW = context.getElementForInheritedWidgetOfExactType<RepositoryScope>()?.widget;
    return inhW is RepositoryScope ? inhW.repositoryStore : null;
  }

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a RepositoryScope of the exact type',
        'out_of_scope',
      );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// e.g. `RepositoryScope.of(context)`
  static RepositoryStore of(BuildContext context) => maybeOf(context) ?? _notFoundInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(RepositoryScope oldWidget) => false;
} // RepositoryScope
