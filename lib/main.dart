import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:l/l.dart';
import 'package:pub_packages/src/app.dart';
import 'package:pub_packages/src/common/constant/environments.dart';
import 'package:pub_packages/src/common/constant/firebase_options.g.dart';
import 'package:pub_packages/src/common/data/injection.dart';

void main() => runZonedGuarded<Future<void>>(() async {
      WidgetsFlutterBinding.ensureInitialized();
      try {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        // ignore: unawaited_futures
        FirebaseAnalytics.instance.logAppOpen();
        await initializeApp(GetIt.instance, env: Environments.development);
      } on Object catch (error, stackTrace) {
        runApp(
          const MaterialApp(
            title: 'Error',
            home: Scaffold(
              body: Center(
                child: Center(
                  child: Text('Initialization error'),
                ),
              ),
            ),
          ),
        );
        l.e(error, stackTrace);
        return;
      }
      runApp(const App());
      // ignore: unnecessary_lambdas
    }, (error, stackTrace) {
      //Error.safeToString(error);
      //stackTrace.toString();
      l.e(error, stackTrace);
    });
