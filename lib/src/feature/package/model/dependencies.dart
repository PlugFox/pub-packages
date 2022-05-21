import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

@immutable
class Dependencies {
  final String? meta;

  const Dependencies({this.meta});

  @override
  String toString() => 'Dependencies(meta: $meta)';

  factory Dependencies.fromMap(Map<String, dynamic> data) => Dependencies(
        meta: data['meta'] as String?,
      );

  Map<String, Object?> toMap() => <String, Object?>{
        'meta': meta,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Dependencies].
  factory Dependencies.fromJson(String data) => Dependencies.fromMap(json.decode(data) as Map<String, dynamic>);

  /// `dart:convert`
  ///
  /// Converts [Dependencies] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Dependencies) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => meta.hashCode;
}
