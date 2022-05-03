import 'dart:async';

import 'package:flutter/material.dart';
import 'package:l/l.dart';
import 'package:pub_packages/src/app.dart';
import 'package:pub_packages/src/feature/initialization/controller/initialization_controller.dart';

void main() => runZonedGuarded<Future<void>>(() async {
      WidgetsFlutterBinding.ensureInitialized();
      final controller = InitializationController();
      await controller.initialize().last;
      final result = controller.getResult();
      print(result.packages);
      runApp(const App());
      // ignore: unnecessary_lambdas
    }, (error, stackTrace) {
      //Error.safeToString(error);
      //stackTrace.toString();
      l.e(error, stackTrace);
    });
