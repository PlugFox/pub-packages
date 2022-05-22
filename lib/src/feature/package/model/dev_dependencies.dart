import 'package:freezed_annotation/freezed_annotation.dart';

part 'dev_dependencies.freezed.dart';
part 'dev_dependencies.g.dart';

@freezed
class DevDependencies with _$DevDependencies {
  factory DevDependencies({
    String? coverage,
    String? test,
  }) = _DevDependencies;

  factory DevDependencies.fromJson(Map<String, dynamic> json) => _$DevDependenciesFromJson(json);
}
