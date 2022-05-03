//import 'dart:convert';
//import 'dart:io' as io;
import 'package:grinder/grinder.dart';
//import 'package:path/path.dart' as path;
//import 'package:pub_api_client/pub_api_client.dart' as pub_api;

void main(List<String> args) => grind(args);

@Task()
void test() => TestRunner().test();

@Task()
@Depends(test)
void build() => Pub.build();

@Task()
void clean() => defaultClean();

@DefaultTask()
Future<void> setup() => Future<void>(() async {
      /*
      final file = io.File(path.normalize('./assets/packages.json'))
        ..createSync(recursive: true);
      final client = pub_api.PubClient();
      final packages = await client.fetchPublisherPackages('plugfox.dev');
      final json =
          await Stream.fromIterable(packages.map<String>((e) => e.package))
              .asyncMap<pub_api.PubPackage>(client.packageInfo)
              .map<Map<String, Object?>>((package) => package.toJson())
              .toList();
      client.close();
      final jsonRaw = jsonEncode(json);
      file.writeAsStringSync(jsonRaw);
      */
    });
