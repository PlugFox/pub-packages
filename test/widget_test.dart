// ignore_for_file: unnecessary_lambdas, prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:pub_packages/src/common/router/app_router.dart';

import 'package:pub_packages/src/common/widget/material_context.dart';

void main() {
  testWidgets('Counter increments smoke test', (tester) async {
    expect(() => MaterialContext(), returnsNormally);
    await tester.pumpWidget(
      AppRouter(
        child: MaterialContext(),
      ),
    );
  });
}
