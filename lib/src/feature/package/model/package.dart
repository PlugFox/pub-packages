import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:pub_packages/src/feature/package/model/latest.dart';
import 'package:pub_packages/src/feature/package/model/version.dart';

@immutable
class Package {
  final String name;
  final Latest latest;
  final List<Version> versions;

  const Package({
    required this.name,
    required this.latest,
    required this.versions,
  });

  @override
  String toString() =>
      'Package(name: $name, latest: $latest, versions: $versions)';

  factory Package.fromMap(Map<String, Object?> data) => Package(
        name: data['name']! as String,
        latest: Latest.fromMap(data['latest']! as Map<String, Object?>),
        versions: (data['versions']! as Iterable<Object?>)
            .cast<Map<String, Object?>>()
            .map<Version>(Version.fromMap)
            .toList(growable: false),
      );

  Map<String, Object?> toMap() => <String, Object?>{
        'name': name,
        'latest': latest.toMap(),
        'versions': versions.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Package].
  factory Package.fromJson(String data) =>
      Package.fromMap(json.decode(data) as Map<String, dynamic>);

  /// `dart:convert`
  ///
  /// Converts [Package] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Package) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => name.hashCode ^ latest.hashCode ^ versions.hashCode;
}
