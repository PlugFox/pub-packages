import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pub_packages/src/feature/initialization/model/repository_store.dart';
import 'package:pub_packages/src/feature/packages/data/get_packages.dart';

/// {@template initialization_controller.initialization_controller}
/// InitializationController class
/// {@endtemplate}
// ignore: prefer_mixin
class InitializationController with ChangeNotifier {
  /// {@macro initialization_controller.initialization_controller}
  InitializationController();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;
  bool get isNotInitialized => !isInitialized;

  InitializationProgress _initializationProgress = InitializationProgress();
  String get message => _initializationProgress.message;
  int get progress => _initializationProgress.progress;

  RepositoryStore getResult() => _initializationProgress.freeze();

  Stream<int> initialize() async* {
    _isInitialized = false;
    final totalSteps = _initializationSteps.length;
    var currentStep = 0;
    var initializationProgress = _initializationProgress;
    final stopwatch = Stopwatch()..start();
    try {
      for (final step in _initializationSteps.entries) {
        currentStep++;
        initializationProgress
          ..progress = (currentStep * 100 ~/ totalSteps).clamp(0, 100)
          ..message = step.key;
        yield initializationProgress.progress;
        notifyListeners();
        initializationProgress = await step.value(initializationProgress);
      }
      initializationProgress
        ..progress = 100
        ..message = 'Initialization completed in ${stopwatch.elapsedMilliseconds} ms';
      yield 100;
      notifyListeners();
      _initializationProgress = initializationProgress;
      _isInitialized = true;
    } finally {
      stopwatch
        ..stop()
        ..reset();
    }
  }
} // InitializationController

typedef InitializationStep = FutureOr<InitializationProgress> Function(InitializationProgress progress);

final Map<String, InitializationStep> _initializationSteps = <String, InitializationStep>{
  'Get packages': (final progress) async {
    final packages = await getPackagesFromAssets();
    return progress..packages = packages;
  },
};
