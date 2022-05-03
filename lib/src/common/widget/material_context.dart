import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pub_packages/src/common/router/app_router.dart';

/// {@template material_context.material_context}
/// MaterialContext widget
/// {@endtemplate}
class MaterialContext extends StatefulWidget {
  /// {@macro material_context.material_context}
  const MaterialContext({
    Key? key,
  }) : super(key: key);

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  @internal
  static _MaterialContextState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_MaterialContextState>();

  @override
  State<MaterialContext> createState() => _MaterialContextState();
} // MaterialContext

/// State for widget MaterialContext
class _MaterialContextState extends State<MaterialContext> {
  @override
  Widget build(BuildContext context) {
    final routerController = AppRouter.of(context);
    return MaterialApp.router(
      title: 'Material App',
      routeInformationParser: routerController.router.routeInformationParser,
      routerDelegate: routerController.router.routerDelegate,
    );
  }
} // _MaterialContextState
