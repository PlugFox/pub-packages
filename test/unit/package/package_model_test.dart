import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';

void packageModelTest() => group('package_model', () {
      late final List<Map<String, Object?>> packagesJson;

      setUpAll(() async {
        final file = File('assets/packages.json');
        final rawJson = await file.readAsString();
        packagesJson = (jsonDecode(rawJson) as List<Object?>).cast<Map<String, Object?>>();
      });

      tearDownAll(packagesJson.clear);

      test('length', () {
        expect(packagesJson.length, isNotEmpty);
      });

      test('from_json', () {
        expect(() => Package.fromJson(packagesJson.first), returnsNormally);
        final package = Package.fromJson(packagesJson.first);
        expect(package, isA<Package>());
      });
    });
