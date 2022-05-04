import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:pub_packages/src/feature/package/model/pubspec.dart';

@immutable
class Version {
  const Version({
    required this.version,
    required this.pubspec,
    required this.archiveUrl,
    required this.published,
  });

  final String version;
  final Pubspec pubspec;
  final String archiveUrl;
  final DateTime published;

  @override
  String toString() => 'Version(version: $version, pubspec: $pubspec, archiveUrl: $archiveUrl, published: $published)';

  factory Version.fromMap(Map<String, dynamic> data) => Version(
        version: data['version']! as String,
        pubspec: Pubspec.fromMap(data['pubspec']! as Map<String, Object?>),
        archiveUrl: data['archive_url']! as String,
        published: DateTime.parse(data['published']! as String).toLocal(),
      );

  Map<String, Object?> toMap() => <String, Object?>{
        'version': version,
        'pubspec': pubspec.toMap(),
        'archive_url': archiveUrl,
        'published': published.toUtc().toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Version].
  factory Version.fromJson(String data) => Version.fromMap(json.decode(data) as Map<String, dynamic>);

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
  int get hashCode => version.hashCode ^ pubspec.hashCode ^ archiveUrl.hashCode ^ published.hashCode;
}
