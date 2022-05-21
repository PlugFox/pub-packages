import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:pub_packages/src/feature/package/model/dependencies.dart';
import 'package:pub_packages/src/feature/package/model/dev_dependencies.dart';
import 'package:pub_packages/src/feature/package/model/environment.dart';

@immutable
class Pubspec {
  final String? name;
  final String? version;
  final String? homepage;
  final Environment? environment;
  final String? description;
  final Dependencies? dependencies;
  final DevDependencies? devDependencies;
  final String? repository;
  final String? issueTracker;

  const Pubspec({
    this.name,
    this.version,
    this.homepage,
    this.environment,
    this.description,
    this.dependencies,
    this.devDependencies,
    this.repository,
    this.issueTracker,
  });

  @override
  String toString() =>
      'Pubspec(name: $name, version: $version, homepage: $homepage, environment: $environment, description: $description, dependencies: $dependencies, devDependencies: $devDependencies, repository: $repository, issueTracker: $issueTracker)';

  factory Pubspec.fromMap(Map<String, dynamic> data) => Pubspec(
        name: data['name'] as String?,
        version: data['version'] as String?,
        homepage: data['homepage'] as String?,
        environment:
            data['environment'] == null ? null : Environment.fromMap(data['environment'] as Map<String, dynamic>),
        description: data['description'] as String?,
        dependencies: data['dependencies'] == null
            ? null
            : Dependencies.fromMap(
                data['dependencies'] as Map<String, dynamic>,
              ),
        devDependencies: data['dev_dependencies'] == null
            ? null
            : DevDependencies.fromMap(
                data['dev_dependencies'] as Map<String, dynamic>,
              ),
        repository: data['repository'] as String?,
        issueTracker: data['issue_tracker'] as String?,
      );

  Map<String, Object?> toMap() => <String, Object?>{
        'name': name,
        'version': version,
        'homepage': homepage,
        'environment': environment?.toMap(),
        'description': description,
        'dependencies': dependencies?.toMap(),
        'dev_dependencies': devDependencies?.toMap(),
        'repository': repository,
        'issue_tracker': issueTracker,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Pubspec].
  factory Pubspec.fromJson(String data) => Pubspec.fromMap(json.decode(data) as Map<String, dynamic>);

  /// `dart:convert`
  ///
  /// Converts [Pubspec] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Pubspec) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      name.hashCode ^
      version.hashCode ^
      homepage.hashCode ^
      environment.hashCode ^
      description.hashCode ^
      dependencies.hashCode ^
      devDependencies.hashCode ^
      repository.hashCode ^
      issueTracker.hashCode;
}
