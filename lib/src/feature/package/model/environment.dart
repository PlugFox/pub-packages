import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

@immutable
class Environment {
  final String? sdk;

  const Environment({this.sdk});

  @override
  String toString() => 'Environment(sdk: $sdk)';

  factory Environment.fromMap(Map<String, dynamic> data) => Environment(
        sdk: data['sdk'] as String?,
      );

  Map<String, Object?> toMap() => <String, Object?>{
        'sdk': sdk,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Environment].
  factory Environment.fromJson(String data) => Environment.fromMap(json.decode(data) as Map<String, dynamic>);

  /// `dart:convert`
  ///
  /// Converts [Environment] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Environment) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => sdk.hashCode;
}
