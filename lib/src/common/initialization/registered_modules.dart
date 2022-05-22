import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisteredModules {
  /// Wraps NSUserDefaults (on iOS) and SharedPreferences (on Android), providing
  /// a persistent store for simple data.
  ///
  /// Data is persisted to disk asynchronously.
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  /// Firebase Authentication SDK
  FirebaseAuth get firebaseAuthentication => FirebaseAuth.instance;

  /// Firebase Analytics API.
  FirebaseAnalytics get firebaseAnalytics => FirebaseAnalytics.instance;

  /// The entry point for accessing a [FirebaseFirestore].
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
}
