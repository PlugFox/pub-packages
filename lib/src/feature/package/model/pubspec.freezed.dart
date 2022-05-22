// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pubspec.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pubspec _$PubspecFromJson(Map<String, dynamic> json) {
  return _Pubspec.fromJson(json);
}

/// @nodoc
mixin _$Pubspec {
  String get name => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String? get homepage => throw _privateConstructorUsedError;
  Environment? get environment => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Dependencies? get dependencies => throw _privateConstructorUsedError;
  @JsonKey(name: 'dev_dependencies')
  DevDependencies? get devDependencies => throw _privateConstructorUsedError;
  String? get repository => throw _privateConstructorUsedError;
  @JsonKey(name: 'issue_tracker')
  String? get issueTracker => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PubspecCopyWith<Pubspec> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PubspecCopyWith<$Res> {
  factory $PubspecCopyWith(Pubspec value, $Res Function(Pubspec) then) =
      _$PubspecCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String version,
      String? homepage,
      Environment? environment,
      String? description,
      Dependencies? dependencies,
      @JsonKey(name: 'dev_dependencies') DevDependencies? devDependencies,
      String? repository,
      @JsonKey(name: 'issue_tracker') String? issueTracker});

  $EnvironmentCopyWith<$Res>? get environment;
  $DependenciesCopyWith<$Res>? get dependencies;
  $DevDependenciesCopyWith<$Res>? get devDependencies;
}

/// @nodoc
class _$PubspecCopyWithImpl<$Res> implements $PubspecCopyWith<$Res> {
  _$PubspecCopyWithImpl(this._value, this._then);

  final Pubspec _value;
  // ignore: unused_field
  final $Res Function(Pubspec) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? version = freezed,
    Object? homepage = freezed,
    Object? environment = freezed,
    Object? description = freezed,
    Object? dependencies = freezed,
    Object? devDependencies = freezed,
    Object? repository = freezed,
    Object? issueTracker = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      homepage: homepage == freezed
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      environment: environment == freezed
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as Environment?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dependencies: dependencies == freezed
          ? _value.dependencies
          : dependencies // ignore: cast_nullable_to_non_nullable
              as Dependencies?,
      devDependencies: devDependencies == freezed
          ? _value.devDependencies
          : devDependencies // ignore: cast_nullable_to_non_nullable
              as DevDependencies?,
      repository: repository == freezed
          ? _value.repository
          : repository // ignore: cast_nullable_to_non_nullable
              as String?,
      issueTracker: issueTracker == freezed
          ? _value.issueTracker
          : issueTracker // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $EnvironmentCopyWith<$Res>? get environment {
    if (_value.environment == null) {
      return null;
    }

    return $EnvironmentCopyWith<$Res>(_value.environment!, (value) {
      return _then(_value.copyWith(environment: value));
    });
  }

  @override
  $DependenciesCopyWith<$Res>? get dependencies {
    if (_value.dependencies == null) {
      return null;
    }

    return $DependenciesCopyWith<$Res>(_value.dependencies!, (value) {
      return _then(_value.copyWith(dependencies: value));
    });
  }

  @override
  $DevDependenciesCopyWith<$Res>? get devDependencies {
    if (_value.devDependencies == null) {
      return null;
    }

    return $DevDependenciesCopyWith<$Res>(_value.devDependencies!, (value) {
      return _then(_value.copyWith(devDependencies: value));
    });
  }
}

/// @nodoc
abstract class _$$_PubspecCopyWith<$Res> implements $PubspecCopyWith<$Res> {
  factory _$$_PubspecCopyWith(
          _$_Pubspec value, $Res Function(_$_Pubspec) then) =
      __$$_PubspecCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String version,
      String? homepage,
      Environment? environment,
      String? description,
      Dependencies? dependencies,
      @JsonKey(name: 'dev_dependencies') DevDependencies? devDependencies,
      String? repository,
      @JsonKey(name: 'issue_tracker') String? issueTracker});

  @override
  $EnvironmentCopyWith<$Res>? get environment;
  @override
  $DependenciesCopyWith<$Res>? get dependencies;
  @override
  $DevDependenciesCopyWith<$Res>? get devDependencies;
}

/// @nodoc
class __$$_PubspecCopyWithImpl<$Res> extends _$PubspecCopyWithImpl<$Res>
    implements _$$_PubspecCopyWith<$Res> {
  __$$_PubspecCopyWithImpl(_$_Pubspec _value, $Res Function(_$_Pubspec) _then)
      : super(_value, (v) => _then(v as _$_Pubspec));

  @override
  _$_Pubspec get _value => super._value as _$_Pubspec;

  @override
  $Res call({
    Object? name = freezed,
    Object? version = freezed,
    Object? homepage = freezed,
    Object? environment = freezed,
    Object? description = freezed,
    Object? dependencies = freezed,
    Object? devDependencies = freezed,
    Object? repository = freezed,
    Object? issueTracker = freezed,
  }) {
    return _then(_$_Pubspec(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      homepage: homepage == freezed
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      environment: environment == freezed
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as Environment?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dependencies: dependencies == freezed
          ? _value.dependencies
          : dependencies // ignore: cast_nullable_to_non_nullable
              as Dependencies?,
      devDependencies: devDependencies == freezed
          ? _value.devDependencies
          : devDependencies // ignore: cast_nullable_to_non_nullable
              as DevDependencies?,
      repository: repository == freezed
          ? _value.repository
          : repository // ignore: cast_nullable_to_non_nullable
              as String?,
      issueTracker: issueTracker == freezed
          ? _value.issueTracker
          : issueTracker // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Pubspec implements _Pubspec {
  _$_Pubspec(
      {required this.name,
      required this.version,
      this.homepage,
      this.environment,
      this.description,
      this.dependencies,
      @JsonKey(name: 'dev_dependencies') this.devDependencies,
      this.repository,
      @JsonKey(name: 'issue_tracker') this.issueTracker});

  factory _$_Pubspec.fromJson(Map<String, dynamic> json) =>
      _$$_PubspecFromJson(json);

  @override
  final String name;
  @override
  final String version;
  @override
  final String? homepage;
  @override
  final Environment? environment;
  @override
  final String? description;
  @override
  final Dependencies? dependencies;
  @override
  @JsonKey(name: 'dev_dependencies')
  final DevDependencies? devDependencies;
  @override
  final String? repository;
  @override
  @JsonKey(name: 'issue_tracker')
  final String? issueTracker;

  @override
  String toString() {
    return 'Pubspec(name: $name, version: $version, homepage: $homepage, environment: $environment, description: $description, dependencies: $dependencies, devDependencies: $devDependencies, repository: $repository, issueTracker: $issueTracker)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pubspec &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other.homepage, homepage) &&
            const DeepCollectionEquality()
                .equals(other.environment, environment) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.dependencies, dependencies) &&
            const DeepCollectionEquality()
                .equals(other.devDependencies, devDependencies) &&
            const DeepCollectionEquality()
                .equals(other.repository, repository) &&
            const DeepCollectionEquality()
                .equals(other.issueTracker, issueTracker));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(homepage),
      const DeepCollectionEquality().hash(environment),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(dependencies),
      const DeepCollectionEquality().hash(devDependencies),
      const DeepCollectionEquality().hash(repository),
      const DeepCollectionEquality().hash(issueTracker));

  @JsonKey(ignore: true)
  @override
  _$$_PubspecCopyWith<_$_Pubspec> get copyWith =>
      __$$_PubspecCopyWithImpl<_$_Pubspec>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PubspecToJson(this);
  }
}

abstract class _Pubspec implements Pubspec {
  factory _Pubspec(
      {required final String name,
      required final String version,
      final String? homepage,
      final Environment? environment,
      final String? description,
      final Dependencies? dependencies,
      @JsonKey(name: 'dev_dependencies') final DevDependencies? devDependencies,
      final String? repository,
      @JsonKey(name: 'issue_tracker') final String? issueTracker}) = _$_Pubspec;

  factory _Pubspec.fromJson(Map<String, dynamic> json) = _$_Pubspec.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get version => throw _privateConstructorUsedError;
  @override
  String? get homepage => throw _privateConstructorUsedError;
  @override
  Environment? get environment => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  Dependencies? get dependencies => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dev_dependencies')
  DevDependencies? get devDependencies => throw _privateConstructorUsedError;
  @override
  String? get repository => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'issue_tracker')
  String? get issueTracker => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PubspecCopyWith<_$_Pubspec> get copyWith =>
      throw _privateConstructorUsedError;
}
