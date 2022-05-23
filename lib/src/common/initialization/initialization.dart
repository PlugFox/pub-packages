import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:l/l.dart';
import 'package:pub_packages/src/common/constant/deployment_environment.dart';
import 'package:pub_packages/src/common/constant/firebase_options.g.dart';
import 'package:pub_packages/src/common/initialization/injection.dart';

Future<void> initializeApp({
  GetIt? getIt,
  String? environment,
  void Function(Object error, StackTrace stackTrace)? onError,
}) async {
  late final WidgetsBinding binding;
  try {
    binding = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();
    final container = getIt ?? GetIt.instance;
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await injectDependencies(
      container,
      environment: environment ?? DeploymentEnvironment.current,
    );
    await container<FirebaseAnalytics>().logAppOpen();
    await _authenticationInitilization(container);
  } on Object catch (error, stackTrace) {
    onError?.call(error, stackTrace);
    rethrow;
  } finally {
    binding.addPostFrameCallback((_) {
      // Closes splash screen, and show the app layout.
      binding.allowFirstFrame();
      //final context = binding.renderViewElement;
    });
  }
}

Future<void> _authenticationInitilization(GetIt container) async {
  final auth = container<FirebaseAuth>();
  if (auth.currentUser != null) return;
  try {
    await auth.userChanges().first.timeout(const Duration(seconds: 1));
  } on TimeoutException {
    l.d('No user found at initialization stage');
  }
}
