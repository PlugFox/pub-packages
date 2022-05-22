import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pub_packages/src/feature/favorites/bloc/favorites_bloc.dart';
import 'package:pub_packages/src/feature/favorites/data/favorites_repository.dart';
import 'package:pub_packages/src/feature/packages/bloc/packages_bloc.dart';
import 'package:pub_packages/src/feature/packages/data/packages_repository.dart';

/// {@template global_bloc_provider}
/// GlobalBlocProvider widget
/// {@endtemplate}
class GlobalBlocProvider extends StatelessWidget {
  /// {@macro global_bloc_provider}
  const GlobalBlocProvider({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: <BlocProvider>[
          BlocProvider<PackagesBLoC>(
            create: (context) => PackagesBLoC(repository: GetIt.instance<IPackagesRepository>()),
          ),
          BlocProvider<FavoritesBLoC>(
            create: (context) => FavoritesBLoC(
              repository: GetIt.instance<IFavoritesRepository>(),
              getUserId: () => GetIt.instance<FirebaseAuth>().currentUser?.uid,
            ),
          ),
        ],
        child: child,
      );
} // GlobalBlocProvider
