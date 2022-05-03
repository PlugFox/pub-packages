import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:pub_packages/src/feature/package/model/pubspec.dart';

@immutable
class Version {
  final String? version;
  final Pubspec? pubspec;
  final String? archiveUrl;
  final String? published;

  const Version({
    this.version,
    this.pubspec,
    this.archiveUrl,
    this.published,
  });

  @override
  String toString() =>
      'Version(version: $version, pubspec: $pubspec, archiveUrl: $archiveUrl, published: $published)';

  factory Version.fromMap(Map<String, dynamic> data) => Version(
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
  /// Parses the string and returns the resulting Json object as [Version].
  factory Version.fromJson(String data) =>
      Version.fromMap(json.decode(data) as Map<String, dynamic>);

  /// `dart:convert`
  ///
  /// Converts [Version] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Version) return false;
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
