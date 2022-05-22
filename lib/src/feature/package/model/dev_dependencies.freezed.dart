// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dev_dependencies.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DevDependencies _$DevDependenciesFromJson(Map<String, dynamic> json) {
  return _DevDependencies.fromJson(json);
}

/// @nodoc
mixin _$DevDependencies {
  String? get coverage => throw _privateConstructorUsedError;
  String? get test => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DevDependenciesCopyWith<DevDependencies> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevDependenciesCopyWith<$Res> {
  factory $DevDependenciesCopyWith(
          DevDependencies value, $Res Function(DevDependencies) then) =
      _$DevDependenciesCopyWithImpl<$Res>;
  $Res call({String? coverage, String? test});
}

/// @nodoc
class _$DevDependenciesCopyWithImpl<$Res>
    implements $DevDependenciesCopyWith<$Res> {
  _$DevDependenciesCopyWithImpl(this._value, this._then);

  final DevDependencies _value;
  // ignore: unused_field
  final $Res Function(DevDependencies) _then;

  @override
  $Res call({
    Object? coverage = freezed,
    Object? test = freezed,
  }) {
    return _then(_value.copyWith(
      coverage: coverage == freezed
          ? _value.coverage
          : coverage // ignore: cast_nullable_to_non_nullable
              as String?,
      test: test == freezed
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_DevDependenciesCopyWith<$Res>
    implements $DevDependenciesCopyWith<$Res> {
  factory _$$_DevDependenciesCopyWith(
          _$_DevDependencies value, $Res Function(_$_DevDependencies) then) =
      __$$_DevDependenciesCopyWithImpl<$Res>;
  @override
  $Res call({String? coverage, String? test});
}

/// @nodoc
class __$$_DevDependenciesCopyWithImpl<$Res>
    extends _$DevDependenciesCopyWithImpl<$Res>
    implements _$$_DevDependenciesCopyWith<$Res> {
  __$$_DevDependenciesCopyWithImpl(
      _$_DevDependencies _value, $Res Function(_$_DevDependencies) _then)
      : super(_value, (v) => _then(v as _$_DevDependencies));

  @override
  _$_DevDependencies get _value => super._value as _$_DevDependencies;

  @override
  $Res call({
    Object? coverage = freezed,
    Object? test = freezed,
  }) {
    return _then(_$_DevDependencies(
      coverage: coverage == freezed
          ? _value.coverage
          : coverage // ignore: cast_nullable_to_non_nullable
              as String?,
      test: test == freezed
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DevDependencies implements _DevDependencies {
  _$_DevDependencies({this.coverage, this.test});

  factory _$_DevDependencies.fromJson(Map<String, dynamic> json) =>
      _$$_DevDependenciesFromJson(json);

  @override
  final String? coverage;
  @override
  final String? test;

  @override
  String toString() {
    return 'DevDependencies(coverage: $coverage, test: $test)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DevDependencies &&
            const DeepCollectionEquality().equals(other.coverage, coverage) &&
            const DeepCollectionEquality().equals(other.test, test));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(coverage),
      const DeepCollectionEquality().hash(test));

  @JsonKey(ignore: true)
  @override
  _$$_DevDependenciesCopyWith<_$_DevDependencies> get copyWith =>
      __$$_DevDependenciesCopyWithImpl<_$_DevDependencies>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DevDependenciesToJson(this);
  }
}

abstract class _DevDependencies implements DevDependencies {
  factory _DevDependencies({final String? coverage, final String? test}) =
      _$_DevDependencies;

  factory _DevDependencies.fromJson(Map<String, dynamic> json) =
      _$_DevDependencies.fromJson;

  @override
  String? get coverage => throw _privateConstructorUsedError;
  @override
  String? get test => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DevDependenciesCopyWith<_$_DevDependencies> get copyWith =>
      throw _privateConstructorUsedError;
}
