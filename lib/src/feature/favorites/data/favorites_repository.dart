import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

/// {@template favorites_repository}
/// IFavoritesRepository class
/// {@endtemplate}
abstract class IFavoritesRepository {
  @useResult
  Future<Set<String>> getFavoritePackages(String userId);
  Future<bool> getPackageState(String userId, String packageName);
  Future<Set<String>> togglePackageState(String userId, String packageName);
} // IFavoritesRepository

/// {@macro favorites_repository}
@Singleton(as: IFavoritesRepository)
class FavoritesRepositoryImpl implements IFavoritesRepository {
  /// {@macro favorites_repository}
  FavoritesRepositoryImpl({
    required FirebaseFirestore firestore,
  }) : _usersCollection = firestore.collection('users');

  static const String _kFavorites = 'favorite_packages';
  final CollectionReference<Map<String, Object?>> _usersCollection;
  DocumentReference<Map<String, Object?>> _getRemoteFavoritesRef(String uid) => _usersCollection.doc(uid);

  @override
  Future<Set<String>> getFavoritePackages(String userId) =>
      _getRemoteFavoritesRef(userId).get(const GetOptions(source: Source.serverAndCache)).then<Set<String>>((snapshot) {
        final data = snapshot.data()?.remove(_kFavorites);
        return data is Iterable<Object?> ? data.whereType<String>().toSet() : <String>{};
      });

  @override
  Future<bool> getPackageState(String userId, String packageName) =>
      getFavoritePackages(userId).then<bool>((packages) => packages.contains(packageName));

  @override
  Future<Set<String>> togglePackageState(String userId, String packageName) async {
    final set = await getFavoritePackages(userId);
    bool isFavorite;
    if (set.contains(packageName)) {
      set.remove(packageName);
      isFavorite = false;
    } else {
      set.add(packageName);
      isFavorite = true;
    }
    final items = <AnalyticsEventItem>[
      AnalyticsEventItem(
        itemId: packageName,
        itemName: packageName,
        itemBrand: 'PlugFox',
      ),
    ];
    return _getRemoteFavoritesRef(userId).set(
      <String, Object?>{_kFavorites: set.toList(growable: false)},
      SetOptions(
        mergeFields: <String>[_kFavorites],
      ),
    ).then<Set<String>>((value) {
      if (isFavorite) {
        FirebaseAnalytics.instance.logAddToCart(items: items);
      } else {
        FirebaseAnalytics.instance.logRemoveFromCart(items: items);
      }
      return getFavoritePackages(userId);
    });
  }
} // FavoritesRepositoryImpl
