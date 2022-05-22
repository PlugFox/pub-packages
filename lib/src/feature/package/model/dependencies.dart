import 'package:freezed_annotation/freezed_annotation.dart';

part 'dependencies.freezed.dart';
part 'dependencies.g.dart';

@freezed
class Dependencies with _$Dependencies {
  const factory Dependencies({
    String? meta,
  }) = _Dependencies;

  factory Dependencies.fromJson(Map<String, dynamic> json) => _$DependenciesFromJson(json);
}
