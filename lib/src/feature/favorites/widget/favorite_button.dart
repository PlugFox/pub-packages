import 'package:flutter/material.dart';
import 'package:pub_packages/src/feature/favorites/widget/favorites_scope.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';

/// {@template favorite_button.favorite_button}
/// FavoriteButton widget
/// {@endtemplate}
class FavoriteButton extends StatelessWidget {
  /// {@macro favorite_button.favorite_button}
  const FavoriteButton({
    required this.packageName,
    Key? key,
  }) : super(key: key);

  final String packageName;

  @override
  Widget build(BuildContext context) => RepaintBoundary(
        child: IconButton(
          icon: ValueListenableBuilder<List<Package>>(
            valueListenable: FavoritesScope.of(context).favorites,
            builder: (context, favorites, _) => AnimatedCrossFade(
              duration: const Duration(milliseconds: 500),
              firstChild: const Icon(Icons.favorite, color: Colors.red),
              secondChild: const Icon(Icons.favorite_border),
              crossFadeState: favorites.map<String>((e) => e.name).contains(packageName)
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
          onPressed: () => FavoritesScope.of(context).togglePackageState(packageName).then<void>(
                (value) => ScaffoldMessenger.maybeOf(context)
                  ?..clearSnackBars()
                  ..showSnackBar(
                    SnackBar(
                      content:
                          Text(value ? 'Added "$packageName" to favorites' : 'Removed "$packageName" from favorites'),
                    ),
                  ),
              ),
        ),
      );
} // FavoriteButton
