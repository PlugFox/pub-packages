import 'package:flutter/material.dart';
import 'package:pub_packages/src/app.dart';

/// {@template app_error}
/// App widget
/// {@endtemplate}
class AppError extends App {
  /// {@macro app_error}
  const AppError({
    this.error,
    this.stackTrace,
    Key? key,
  }) : super(key: key);

  /// Error
  final Object? error;

  /// Stack trace
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Error',
        home: Scaffold(
          body: Center(
            child: Center(
              child: Text(error?.toString() ?? 'Unknown error'),
            ),
          ),
        ),
      );
} // AppError
