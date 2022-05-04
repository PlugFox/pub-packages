import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:l/l.dart';
import 'package:pub_packages/src/app.dart';
import 'package:pub_packages/src/common/constant/firebase_options.g.dart';
import 'package:pub_packages/src/feature/initialization/controller/initialization_controller.dart';
import 'package:pub_packages/src/feature/initialization/model/repository_store.dart';

void main() => runZonedGuarded<Future<void>>(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      // ignore: unawaited_futures
      FirebaseAnalytics.instance.logAppOpen();
      final controller = InitializationController();
      final repositoryStore =
          await controller.initialize().drain<void>().then<RepositoryStore>((_) => controller.getResult());
      runApp(App(repositoryStore: repositoryStore));
      // ignore: unnecessary_lambdas
    }, (error, stackTrace) {
      //Error.safeToString(error);
      //stackTrace.toString();
      l.e(error, stackTrace);
    });
