import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:l/l.dart';
import 'package:pub_packages/src/feature/favorites/data/favorites_repository.dart';

part 'favorites_bloc.freezed.dart';

/* Favorites Events */

@freezed
class FavoritesEvent with _$FavoritesEvent {
  const FavoritesEvent._();

  /// [force] - drop current state and fetch again
  const factory FavoritesEvent.fetch({@Default(false) bool force}) = FetchFavoritesEvent;

  const factory FavoritesEvent.toggle(String packageName) = ToggleFavoritesEvent;
}

/* Favorites States */

@freezed
class FavoritesState with _$FavoritesState {
  const FavoritesState._();

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
  const factory FavoritesState.idle({
    required final Set<String> favorites,
    @Default('Idle') final String message,
  }) = IdleFavoritesState;

  /// Processing
  const factory FavoritesState.processing({
    required final Set<String> favorites,
    @Default('Processing') final String message,
  }) = ProcessingFavoritesState;

  /// Successful
  const factory FavoritesState.successfulFetched({
    required final Set<String> favorites,
    @Default('Successful fetched') final String message,
  }) = SuccessfulFetchedFavoritesState;

  /// Successful
  const factory FavoritesState.successfulToggled({
    required final Set<String> favorites,
    required final String packageName,
    required final bool isFavorite,
    @Default('Successful toggled') final String message,
  }) = SuccessfulToggledFavoritesState;

  /// An error has occurred
  const factory FavoritesState.error({
    required final Set<String> favorites,
    @Default('An error has occurred') final String message,
  }) = ErrorFavoritesState;
}

/// Buisiness Logic Component FavoritesBLoC
class FavoritesBLoC extends Bloc<FavoritesEvent, FavoritesState> implements EventSink<FavoritesEvent> {
  FavoritesBLoC({
    required final IFavoritesRepository repository,
    required final String? Function() getUserId,
    final FavoritesState? initialState,
  })  : _repository = repository,
        _getUserId = getUserId,
        super(
          initialState ??
              const FavoritesState.idle(
                favorites: <String>{},
                message: 'Initial idle state',
              ),
        ) {
    on<FavoritesEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) => _fetch(event, emit),
        toggle: (event) => _toggle(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IFavoritesRepository _repository;
  final String? Function() _getUserId;

  /// Fetch event handler
  Future<void> _fetch(FetchFavoritesEvent event, Emitter<FavoritesState> emit) async {
    final uid = _getUserId();
    if (uid == null) return emit(const FavoritesState.idle(favorites: <String>{}));
    try {
      emit(FavoritesState.processing(favorites: event.force ? <String>{} : state.favorites));
      final newData = await _repository.getFavoritePackages(uid);
      emit(FavoritesState.successfulFetched(favorites: newData));
    } on Object catch (err, stackTrace) {
      l.e('В FavoritesBLoC произошла ошибка: $err', stackTrace);
      emit(FavoritesState.error(favorites: state.favorites));
      rethrow;
    } finally {
      emit(FavoritesState.idle(favorites: state.favorites));
    }
  }

  /// Toggle event handler
  Future<void> _toggle(ToggleFavoritesEvent event, Emitter<FavoritesState> emit) async {
    final uid = _getUserId();
    if (uid == null) return emit(const FavoritesState.idle(favorites: <String>{}));
    try {
      emit(FavoritesState.processing(favorites: state.favorites));
      final newData = await _repository.togglePackageState(uid, event.packageName);
      emit(
        FavoritesState.successfulToggled(
          favorites: newData,
          packageName: event.packageName,
          isFavorite: newData.contains(event.packageName),
        ),
      );
    } on Object catch (err, stackTrace) {
      l.e('В FavoritesBLoC произошла ошибка: $err', stackTrace);
      emit(FavoritesState.error(favorites: state.favorites));
      rethrow;
    } finally {
      emit(FavoritesState.idle(favorites: state.favorites));
    }
  }
}
