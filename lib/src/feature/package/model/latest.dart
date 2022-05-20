import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:pub_packages/src/feature/package/model/version.dart';

@immutable
class Latest extends Version {
  const Latest({
    required super.version,
    required super.pubspec,
    required super.archiveUrl,
    required super.published,
  });

  @override
  String toString() =>
      'Latest(version: $version, pubspec: $pubspec, archiveUrl: $archiveUrl, published: $published)';

  factory Latest.fromMap(Map<String, dynamic> data) {
    final version = Version.fromMap(data);
    return Latest(
      version: version.version,
      pubspec: version.pubspec,
      archiveUrl: version.archiveUrl,
      published: version.published,
    );
  }

  factory Latest.fromJson(String data) =>
      Latest.fromMap(json.decode(data) as Map<String, Object?>);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Latest) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      version.hashCode ^
      pubspec.hashCode ^
      archiveUrl.hashCode ^
      published.hashCode;
}
