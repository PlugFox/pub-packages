// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repository_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InitializationProgress {
  String get message => throw _privateConstructorUsedError;
  set message(String value) => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;
  set progress(int value) => throw _privateConstructorUsedError;
  SharedPreferences? get sharedPreferences =>
      throw _privateConstructorUsedError;
  set sharedPreferences(SharedPreferences? value) =>
      throw _privateConstructorUsedError;
  List<Package>? get packages => throw _privateConstructorUsedError;
  set packages(List<Package>? value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InitializationProgressCopyWith<InitializationProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializationProgressCopyWith<$Res> {
  factory $InitializationProgressCopyWith(InitializationProgress value,
          $Res Function(InitializationProgress) then) =
      _$InitializationProgressCopyWithImpl<$Res>;
  $Res call(
      {String message,
      int progress,
      SharedPreferences? sharedPreferences,
      List<Package>? packages});
}

/// @nodoc
class _$InitializationProgressCopyWithImpl<$Res>
    implements $InitializationProgressCopyWith<$Res> {
  _$InitializationProgressCopyWithImpl(this._value, this._then);

  final InitializationProgress _value;
  // ignore: unused_field
  final $Res Function(InitializationProgress) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? progress = freezed,
    Object? sharedPreferences = freezed,
    Object? packages = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      sharedPreferences: sharedPreferences == freezed
          ? _value.sharedPreferences
          : sharedPreferences // ignore: cast_nullable_to_non_nullable
              as SharedPreferences?,
      packages: packages == freezed
          ? _value.packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<Package>?,
    ));
  }
}

/// @nodoc
abstract class _$$_InitializationProgressCopyWith<$Res>
    implements $InitializationProgressCopyWith<$Res> {
  factory _$$_InitializationProgressCopyWith(_$_InitializationProgress value,
          $Res Function(_$_InitializationProgress) then) =
      __$$_InitializationProgressCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message,
      int progress,
      SharedPreferences? sharedPreferences,
      List<Package>? packages});
}

/// @nodoc
class __$$_InitializationProgressCopyWithImpl<$Res>
    extends _$InitializationProgressCopyWithImpl<$Res>
    implements _$$_InitializationProgressCopyWith<$Res> {
  __$$_InitializationProgressCopyWithImpl(_$_InitializationProgress _value,
      $Res Function(_$_InitializationProgress) _then)
      : super(_value, (v) => _then(v as _$_InitializationProgress));

  @override
  _$_InitializationProgress get _value =>
      super._value as _$_InitializationProgress;

  @override
  $Res call({
    Object? message = freezed,
    Object? progress = freezed,
    Object? sharedPreferences = freezed,
    Object? packages = freezed,
  }) {
    return _then(_$_InitializationProgress(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      sharedPreferences: sharedPreferences == freezed
          ? _value.sharedPreferences
          : sharedPreferences // ignore: cast_nullable_to_non_nullable
              as SharedPreferences?,
      packages: packages == freezed
          ? _value.packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<Package>?,
    ));
  }
}

/// @nodoc

class _$_InitializationProgress extends _InitializationProgress {
  _$_InitializationProgress(
      {this.message = 'Not initialized',
      this.progress = 0,
      this.sharedPreferences,
      this.packages})
      : super._();

  @override
  @JsonKey()
  String message;
  @override
  @JsonKey()
  int progress;
  @override
  SharedPreferences? sharedPreferences;
  @override
  List<Package>? packages;

  @override
  String toString() {
    return 'InitializationProgress(message: $message, progress: $progress, sharedPreferences: $sharedPreferences, packages: $packages)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_InitializationProgressCopyWith<_$_InitializationProgress> get copyWith =>
      __$$_InitializationProgressCopyWithImpl<_$_InitializationProgress>(
          this, _$identity);
}

abstract class _InitializationProgress extends InitializationProgress {
  factory _InitializationProgress(
      {String message,
      int progress,
      SharedPreferences? sharedPreferences,
      List<Package>? packages}) = _$_InitializationProgress;
  _InitializationProgress._() : super._();

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  int get progress => throw _privateConstructorUsedError;
  @override
  SharedPreferences? get sharedPreferences =>
      throw _privateConstructorUsedError;
  @override
  List<Package>? get packages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitializationProgressCopyWith<_$_InitializationProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RepositoryStore {
  SharedPreferences get sharedPreferences => throw _privateConstructorUsedError;
  List<Package> get packages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepositoryStoreCopyWith<RepositoryStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryStoreCopyWith<$Res> {
  factory $RepositoryStoreCopyWith(
          RepositoryStore value, $Res Function(RepositoryStore) then) =
      _$RepositoryStoreCopyWithImpl<$Res>;
  $Res call({SharedPreferences sharedPreferences, List<Package> packages});
}

/// @nodoc
class _$RepositoryStoreCopyWithImpl<$Res>
    implements $RepositoryStoreCopyWith<$Res> {
  _$RepositoryStoreCopyWithImpl(this._value, this._then);

  final RepositoryStore _value;
  // ignore: unused_field
  final $Res Function(RepositoryStore) _then;

  @override
  $Res call({
    Object? sharedPreferences = freezed,
    Object? packages = freezed,
  }) {
    return _then(_value.copyWith(
      sharedPreferences: sharedPreferences == freezed
          ? _value.sharedPreferences
          : sharedPreferences // ignore: cast_nullable_to_non_nullable
              as SharedPreferences,
      packages: packages == freezed
          ? _value.packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<Package>,
    ));
  }
}

/// @nodoc
abstract class _$$_RepositoryStoreCopyWith<$Res>
    implements $RepositoryStoreCopyWith<$Res> {
  factory _$$_RepositoryStoreCopyWith(
          _$_RepositoryStore value, $Res Function(_$_RepositoryStore) then) =
      __$$_RepositoryStoreCopyWithImpl<$Res>;
  @override
  $Res call({SharedPreferences sharedPreferences, List<Package> packages});
}

/// @nodoc
class __$$_RepositoryStoreCopyWithImpl<$Res>
    extends _$RepositoryStoreCopyWithImpl<$Res>
    implements _$$_RepositoryStoreCopyWith<$Res> {
  __$$_RepositoryStoreCopyWithImpl(
      _$_RepositoryStore _value, $Res Function(_$_RepositoryStore) _then)
      : super(_value, (v) => _then(v as _$_RepositoryStore));

  @override
  _$_RepositoryStore get _value => super._value as _$_RepositoryStore;

  @override
  $Res call({
    Object? sharedPreferences = freezed,
    Object? packages = freezed,
  }) {
    return _then(_$_RepositoryStore(
      sharedPreferences: sharedPreferences == freezed
          ? _value.sharedPreferences
          : sharedPreferences // ignore: cast_nullable_to_non_nullable
              as SharedPreferences,
      packages: packages == freezed
          ? _value._packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<Package>,
    ));
  }
}

/// @nodoc

class _$_RepositoryStore implements _RepositoryStore {
  _$_RepositoryStore(
      {required this.sharedPreferences, required final List<Package> packages})
      : _packages = packages;

  @override
  final SharedPreferences sharedPreferences;
  final List<Package> _packages;
  @override
  List<Package> get packages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packages);
  }

  @override
  String toString() {
    return 'RepositoryStore(sharedPreferences: $sharedPreferences, packages: $packages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepositoryStore &&
            const DeepCollectionEquality()
                .equals(other.sharedPreferences, sharedPreferences) &&
            const DeepCollectionEquality().equals(other._packages, _packages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sharedPreferences),
      const DeepCollectionEquality().hash(_packages));

  @JsonKey(ignore: true)
  @override
  _$$_RepositoryStoreCopyWith<_$_RepositoryStore> get copyWith =>
      __$$_RepositoryStoreCopyWithImpl<_$_RepositoryStore>(this, _$identity);
}

abstract class _RepositoryStore implements RepositoryStore {
  factory _RepositoryStore(
      {required final SharedPreferences sharedPreferences,
      required final List<Package> packages}) = _$_RepositoryStore;

  @override
  SharedPreferences get sharedPreferences => throw _privateConstructorUsedError;
  @override
  List<Package> get packages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RepositoryStoreCopyWith<_$_RepositoryStore> get copyWith =>
      throw _privateConstructorUsedError;
}
