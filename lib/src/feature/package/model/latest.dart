import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:pub_packages/src/feature/package/model/pubspec.dart';

@immutable
class Latest {
  final String? version;
  final Pubspec? pubspec;
  final String? archiveUrl;
  final String? published;

  const Latest({
    this.version,
    this.pubspec,
    this.archiveUrl,
    this.published,
  });

  @override
  String toString() =>
      'Latest(version: $version, pubspec: $pubspec, archiveUrl: $archiveUrl, published: $published)';

  factory Latest.fromMap(Map<String, dynamic> data) => Latest(
        version: data['version'] as String?,
        pubspec: data['pubspec'] == null
            ? null
            : Pubspec.fromMap(data['pubspec'] as Map<String, dynamic>),
        archiveUrl: data['archive_url'] as String?,
        published: data['published'] as String?,
      );

  Map<String, Object?> toMap() => <String, Object?>{
        'version': version,
        'pubspec': pubspec?.toMap(),
        'archive_url': archiveUrl,
        'published': published,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Latest].
  factory Latest.fromJson(String data) =>
      Latest.fromMap(json.decode(data) as Map<String, dynamic>);

  /// `dart:convert`
  ///
  /// Converts [Latest] to a JSON string.
  String toJson() => json.encode(toMap());

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
