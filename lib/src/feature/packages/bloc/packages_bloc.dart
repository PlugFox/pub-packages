import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';
import 'package:pub_packages/src/feature/packages/data/packages_repository.dart';

part 'packages_bloc.freezed.dart';

/* Packages Events */

abstract class PackagesEvent {}

/* Packages States */

@freezed
class PackagesState with _$PackagesState {
  const PackagesState._();

  /// Is in idle state
  bool get idling => !isProcessing;

  /// Is in progress state
  bool get isProcessing => maybeMap<bool>(
        orElse: () => true,
        idle: (_) => false,
      );

  /// If an error has occurred
  bool get hasError => maybeMap<bool>(orElse: () => false, error: (_) => true);

  /// Idling state
  const factory PackagesState.idle({
    required final List<Package> packages,
    @Default('Idle') final String message,
  }) = IdlePackagesState;

  /// Processing
  const factory PackagesState.processing({
    required final List<Package> packages,
    @Default('Processing') final String message,
  }) = ProcessingPackagesState;

  /// Successful
  const factory PackagesState.successful({
    required final List<Package> packages,
    @Default('Successful') final String message,
  }) = SuccessfulPackagesState;

  /// An error has occurred
  const factory PackagesState.error({
    required final List<Package> packages,
    @Default('An error has occurred') final String message,
  }) = ErrorPackagesState;
}

/// Buisiness Logic Component PackagesBLoC
class PackagesBLoC extends Bloc<PackagesEvent, PackagesState> implements EventSink<PackagesEvent> {
  PackagesBLoC({
    required final IPackagesRepository repository,
    final PackagesState? initialState,
  })  : _repository = repository,
        super(
          initialState ??
              PackagesState.idle(
                packages: UnmodifiableListView<Package>(repository.getPackages()),
                message: 'Initial idle state',
              ),
        );

  // ignore: unused_field
  final IPackagesRepository _repository;
}
