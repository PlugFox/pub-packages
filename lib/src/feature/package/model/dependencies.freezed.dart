// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dependencies.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dependencies _$DependenciesFromJson(Map<String, dynamic> json) {
  return _Dependencies.fromJson(json);
}

/// @nodoc
mixin _$Dependencies {
  String? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DependenciesCopyWith<Dependencies> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DependenciesCopyWith<$Res> {
  factory $DependenciesCopyWith(
          Dependencies value, $Res Function(Dependencies) then) =
      _$DependenciesCopyWithImpl<$Res>;
  $Res call({String? meta});
}

/// @nodoc
class _$DependenciesCopyWithImpl<$Res> implements $DependenciesCopyWith<$Res> {
  _$DependenciesCopyWithImpl(this._value, this._then);

  final Dependencies _value;
  // ignore: unused_field
  final $Res Function(Dependencies) _then;

  @override
  $Res call({
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_DependenciesCopyWith<$Res>
    implements $DependenciesCopyWith<$Res> {
  factory _$$_DependenciesCopyWith(
          _$_Dependencies value, $Res Function(_$_Dependencies) then) =
      __$$_DependenciesCopyWithImpl<$Res>;
  @override
  $Res call({String? meta});
}

/// @nodoc
class __$$_DependenciesCopyWithImpl<$Res>
    extends _$DependenciesCopyWithImpl<$Res>
    implements _$$_DependenciesCopyWith<$Res> {
  __$$_DependenciesCopyWithImpl(
      _$_Dependencies _value, $Res Function(_$_Dependencies) _then)
      : super(_value, (v) => _then(v as _$_Dependencies));

  @override
  _$_Dependencies get _value => super._value as _$_Dependencies;

  @override
  $Res call({
    Object? meta = freezed,
  }) {
    return _then(_$_Dependencies(
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Dependencies implements _Dependencies {
  _$_Dependencies({this.meta});

  factory _$_Dependencies.fromJson(Map<String, dynamic> json) =>
      _$$_DependenciesFromJson(json);

  @override
  final String? meta;

  @override
  String toString() {
    return 'Dependencies(meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dependencies &&
            const DeepCollectionEquality().equals(other.meta, meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(meta));

  @JsonKey(ignore: true)
  @override
  _$$_DependenciesCopyWith<_$_Dependencies> get copyWith =>
      __$$_DependenciesCopyWithImpl<_$_Dependencies>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DependenciesToJson(this);
  }
}

abstract class _Dependencies implements Dependencies {
  factory _Dependencies({final String? meta}) = _$_Dependencies;

  factory _Dependencies.fromJson(Map<String, dynamic> json) =
      _$_Dependencies.fromJson;

  @override
  String? get meta => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DependenciesCopyWith<_$_Dependencies> get copyWith =>
      throw _privateConstructorUsedError;
}
