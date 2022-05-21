import 'dart:async';

import 'package:flutter/material.dart';
import 'package:l/l.dart';
import 'package:pub_packages/src/app.dart';
import 'package:pub_packages/src/app_error.dart';
import 'package:pub_packages/src/common/initialization/initialization.dart';

void main() => runZonedGuarded<Future<void>>(
      () async {
        await initializeApp(
          onError: (error, stackTrace) {
            runApp(AppError(error: error, stackTrace: stackTrace));
          },
        );
        runApp(const App());
      },
      l.e,
    );
