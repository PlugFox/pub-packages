import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

@immutable
class DevDependencies {
  const DevDependencies({this.coverage, this.test});

  final String? coverage;
  final String? test;

  @override
  String toString() => 'DevDependencies(coverage: $coverage, test: $test)';

  factory DevDependencies.fromMap(Map<String, dynamic> data) => DevDependencies(
        coverage: data['coverage'] as String?,
        test: data['test'] as String?,
      );

  Map<String, Object?> toMap() => <String, Object?>{
        'coverage': coverage,
        'test': test,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DevDependencies].
  factory DevDependencies.fromJson(String data) =>
      DevDependencies.fromMap(json.decode(data) as Map<String, dynamic>);

  /// `dart:convert`
  ///
  /// Converts [DevDependencies] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DevDependencies) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => coverage.hashCode ^ test.hashCode;
}
