import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see element with key {"LoginUserName"}
Future<void> iSeeElementWithKey(WidgetTester tester, String param1) async {
  expect(find.byKey(Key(param1)), findsOneWidget);
}
