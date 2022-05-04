import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pub_packages/src/common/constant/assets.gen.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';

Future<List<Package>> getPackagesFromAssets() async {
  final json = await rootBundle.loadString(Assets.packages);
  return compute<String, List<Package>>(_decode, json);
}

List<Package> _decode(String json) {
  final decoded = jsonDecode(json) as List<Object?>;
  final packages = decoded.cast<Map<String, Object?>>().map<Package>(Package.fromMap).toList(growable: false);
  return packages
      .map<Package>((e) => e..versions.sort((a, b) => b.published.compareTo(a.published)))
      .toList(growable: false);
}
