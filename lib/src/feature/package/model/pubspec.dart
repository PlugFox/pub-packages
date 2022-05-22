// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pub_packages/src/feature/package/model/dependencies.dart';
import 'package:pub_packages/src/feature/package/model/dev_dependencies.dart';
import 'package:pub_packages/src/feature/package/model/environment.dart';

part 'pubspec.freezed.dart';
part 'pubspec.g.dart';

@freezed
class Pubspec with _$Pubspec {
  factory Pubspec({
    required String name,
    required String version,
    String? homepage,
    Environment? environment,
    String? description,
    Dependencies? dependencies,
    @JsonKey(name: 'dev_dependencies') DevDependencies? devDependencies,
    String? repository,
    @JsonKey(name: 'issue_tracker') String? issueTracker,
  }) = _Pubspec;

  factory Pubspec.fromJson(Map<String, dynamic> json) => _$PubspecFromJson(json);
}
