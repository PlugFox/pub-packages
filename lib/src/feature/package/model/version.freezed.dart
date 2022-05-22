// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Version _$VersionFromJson(Map<String, dynamic> json) {
  return _Version.fromJson(json);
}

/// @nodoc
mixin _$Version {
  String get version => throw _privateConstructorUsedError;
  Pubspec get pubspec => throw _privateConstructorUsedError;
  String get published => throw _privateConstructorUsedError;
  @JsonKey(name: 'archive_url')
  String get archiveUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VersionCopyWith<Version> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionCopyWith<$Res> {
  factory $VersionCopyWith(Version value, $Res Function(Version) then) =
      _$VersionCopyWithImpl<$Res>;
  $Res call(
      {String version,
      Pubspec pubspec,
      String published,
      @JsonKey(name: 'archive_url') String archiveUrl});

  $PubspecCopyWith<$Res> get pubspec;
}

/// @nodoc
class _$VersionCopyWithImpl<$Res> implements $VersionCopyWith<$Res> {
  _$VersionCopyWithImpl(this._value, this._then);

  final Version _value;
  // ignore: unused_field
  final $Res Function(Version) _then;

  @override
  $Res call({
    Object? version = freezed,
    Object? pubspec = freezed,
    Object? published = freezed,
    Object? archiveUrl = freezed,
  }) {
    return _then(_value.copyWith(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      pubspec: pubspec == freezed
          ? _value.pubspec
          : pubspec // ignore: cast_nullable_to_non_nullable
              as Pubspec,
      published: published == freezed
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
              as String,
      archiveUrl: archiveUrl == freezed
          ? _value.archiveUrl
          : archiveUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $PubspecCopyWith<$Res> get pubspec {
    return $PubspecCopyWith<$Res>(_value.pubspec, (value) {
      return _then(_value.copyWith(pubspec: value));
    });
  }
}

/// @nodoc
abstract class _$$_VersionCopyWith<$Res> implements $VersionCopyWith<$Res> {
  factory _$$_VersionCopyWith(
          _$_Version value, $Res Function(_$_Version) then) =
      __$$_VersionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String version,
      Pubspec pubspec,
      String published,
      @JsonKey(name: 'archive_url') String archiveUrl});

  @override
  $PubspecCopyWith<$Res> get pubspec;
}

/// @nodoc
class __$$_VersionCopyWithImpl<$Res> extends _$VersionCopyWithImpl<$Res>
    implements _$$_VersionCopyWith<$Res> {
  __$$_VersionCopyWithImpl(_$_Version _value, $Res Function(_$_Version) _then)
      : super(_value, (v) => _then(v as _$_Version));

  @override
  _$_Version get _value => super._value as _$_Version;

  @override
  $Res call({
    Object? version = freezed,
    Object? pubspec = freezed,
    Object? published = freezed,
    Object? archiveUrl = freezed,
  }) {
    return _then(_$_Version(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      pubspec: pubspec == freezed
          ? _value.pubspec
          : pubspec // ignore: cast_nullable_to_non_nullable
              as Pubspec,
      published: published == freezed
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
              as String,
      archiveUrl: archiveUrl == freezed
          ? _value.archiveUrl
          : archiveUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Version extends _Version {
  const _$_Version(
      {required this.version,
      required this.pubspec,
      required this.published,
      @JsonKey(name: 'archive_url') required this.archiveUrl})
      : super._();

  factory _$_Version.fromJson(Map<String, dynamic> json) =>
      _$$_VersionFromJson(json);

  @override
  final String version;
  @override
  final Pubspec pubspec;
  @override
  final String published;
  @override
  @JsonKey(name: 'archive_url')
  final String archiveUrl;

  @override
  String toString() {
    return 'Version(version: $version, pubspec: $pubspec, published: $published, archiveUrl: $archiveUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Version &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other.pubspec, pubspec) &&
            const DeepCollectionEquality().equals(other.published, published) &&
            const DeepCollectionEquality()
                .equals(other.archiveUrl, archiveUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(pubspec),
      const DeepCollectionEquality().hash(published),
      const DeepCollectionEquality().hash(archiveUrl));

  @JsonKey(ignore: true)
  @override
  _$$_VersionCopyWith<_$_Version> get copyWith =>
      __$$_VersionCopyWithImpl<_$_Version>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VersionToJson(this);
  }
}

abstract class _Version extends Version {
  const factory _Version(
          {required final String version,
          required final Pubspec pubspec,
          required final String published,
          @JsonKey(name: 'archive_url') required final String archiveUrl}) =
      _$_Version;
  const _Version._() : super._();

  factory _Version.fromJson(Map<String, dynamic> json) = _$_Version.fromJson;

  @override
  String get version => throw _privateConstructorUsedError;
  @override
  Pubspec get pubspec => throw _privateConstructorUsedError;
  @override
  String get published => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'archive_url')
  String get archiveUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_VersionCopyWith<_$_Version> get copyWith =>
      throw _privateConstructorUsedError;
}
