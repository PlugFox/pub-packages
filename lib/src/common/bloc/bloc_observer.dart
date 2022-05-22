import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l/l.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc<Object?, Object?> bloc, Transition transition) {
    super.onTransition(bloc, transition);
    l.v6(transition);
  }

  @override
  void onError(BlocBase<Object?> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    l.w(error, stackTrace);
  }
}
