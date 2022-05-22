import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pub_packages/src/feature/package/model/version.dart';

part 'package.freezed.dart';
part 'package.g.dart';

@freezed
class Package with _$Package {
  factory Package({
    required String name,
    required Version latest,
    required List<Version> versions,
  }) = _Package;

  factory Package.fromJson(Map<String, dynamic> json) => _$PackageFromJson(json);
}
