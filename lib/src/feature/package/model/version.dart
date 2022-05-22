// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pub_packages/src/feature/package/model/pubspec.dart';

part 'version.freezed.dart';
part 'version.g.dart';

@freezed
class Version with _$Version {
  const Version._();

  const factory Version.latest({
    required String version,
    required Pubspec pubspec,
    required String published,
    @JsonKey(name: 'archive_url') required String archiveUrl,
  }) = LatestVersion;

  const factory Version({
    required String version,
    required Pubspec pubspec,
    required String published,
    @JsonKey(name: 'archive_url') required String archiveUrl,
  }) = PreviousVersion;

  DateTime get publishedDate => DateTime.parse(published);

  factory Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);
}
