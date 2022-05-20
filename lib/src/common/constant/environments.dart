import 'package:flutter/foundation.dart';

abstract class Environments {
  Environments._();

  static String? _current;
  static String get current => _current ??= () {
        const flavor = String.fromEnvironment('environment');
        switch (flavor) {
          case integration:
            return integration;
          case development:
            return development;
          case staging:
            return staging;
          case production:
            return production;
          default:
            break;
        }
        if (kProfileMode) {
          return staging;
        } else if (kDebugMode) {
          return development;
        } else if (kReleaseMode) {
          return production;
        }
        return integration;
      }();

  static void setEnvironment(String environment) {
    switch (environment) {
      case integration:
        _current = integration;
        return;
      case development:
        _current = development;
        return;
      case staging:
        _current = staging;
        return;
      case production:
        _current = production;
        return;
      default:
        break;
    }
  }

  static const String integration = 'integration';
  static const String development = 'development';
  static const String staging = 'staging';
  static const String production = 'production';

  static T map<T>({
    required T Function() integration,
    required T Function() development,
    required T Function() staging,
    required T Function() production,
  }) {
    switch (current) {
      case Environments.integration:
        return integration();
      case Environments.development:
        return development();
      case Environments.staging:
        return staging();
      case Environments.production:
        return production();
      default:
        throw UnsupportedError('Unknown environment: $current');
    }
  }

  static T maybeMap<T>({
    required T Function() orElse,
    T Function()? integration,
    T Function()? development,
    T Function()? staging,
    T Function()? production,
  }) =>
      map<T>(
        integration: integration ?? orElse,
        development: development ?? orElse,
        staging: staging ?? orElse,
        production: production ?? orElse,
      );
}
