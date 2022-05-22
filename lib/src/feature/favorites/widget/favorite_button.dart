import 'package:flutter/material.dart';
import 'package:pub_packages/src/feature/favorites/widget/favorites_scope.dart';

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
          icon: AnimatedCrossFade(
            duration: const Duration(milliseconds: 500),
            firstChild: const Icon(Icons.favorite, color: Colors.red),
            secondChild: const Icon(Icons.favorite_border),
            crossFadeState:
                FavoritesScope.favoritesOf(context, listen: true).map<String>((e) => e.name).contains(packageName)
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
          ),
          onPressed: () => FavoritesScope.toggleOf(context, packageName: packageName),
        ),
      );
} // FavoriteButton
