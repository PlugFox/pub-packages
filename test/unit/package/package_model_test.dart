import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';

void main() => packageModelTest();

void packageModelTest() => group('package_model', () {
      var packagesJson = <Map<String, Object?>>[];

      setUpAll(() async {
        try {
          final file = File('assets/packages.json');
          final rawJson = await file.readAsString();
          packagesJson = (jsonDecode(rawJson) as List<Object?>).cast<Map<String, Object?>>();
        } on Object {
          fail('Asset file can not be decoded');
        }
      });

      tearDownAll(packagesJson.clear);

      test('is_not_empty', () {
        expect(packagesJson, isNotEmpty);
      });

      test('from_json', () {
        expect(() => Package.fromJson(packagesJson.first), returnsNormally);
        final package = Package.fromJson(packagesJson.first);
        expect(package, isA<Package>());
      });
    });
