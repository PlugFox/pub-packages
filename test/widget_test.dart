// ignore_for_file: unnecessary_lambdas, prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';

import 'package:pub_packages/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (tester) async {
    expect(() => App(), returnsNormally);
    await tester.pumpWidget(const App());
  });
}
