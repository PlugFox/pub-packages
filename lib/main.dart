import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart' as concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l/l.dart';
import 'package:pub_packages/src/app.dart';
import 'package:pub_packages/src/app_error.dart';
import 'package:pub_packages/src/common/bloc/bloc_observer.dart';
import 'package:pub_packages/src/common/initialization/initialization.dart';

void main() => runZonedGuarded<Future<void>>(
      () => l.capture(
        () => BlocOverrides.runZoned(
          () async {
            await initializeApp(
              onError: (error, stackTrace) {
                runApp(AppError(error: error, stackTrace: stackTrace));
              },
            );
            runApp(const App());
          },
          blocObserver: AppBlocObserver(),
          eventTransformer: concurrency.sequential<Object?>(),
        ),
        const LogOptions(
          handlePrint: true,
          outputInRelease: true,
          printColors: true,
        ),
      ),
      l.e,
    );
