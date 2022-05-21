import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:l/l.dart';
import 'package:pub_packages/src/common/initialization/injection.config.dart';

@InjectableInit(
  asExtension: true,
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  usesNullSafety: true,
  // ignoreUnregisteredTypes: [],
)
Future<GetIt> injectDependencies(
  GetIt getIt, {
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
  l.d('_initializeApp');
  final container = await getIt.$initGetIt(
    environment: environment,
    environmentFilter: environmentFilter,
  );
  await container.allReady(timeout: const Duration(seconds: 15));
  l.i('GetIt initialized');
  return container;
}
