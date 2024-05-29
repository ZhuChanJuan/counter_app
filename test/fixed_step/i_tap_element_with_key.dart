import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap element with key {"LoginBtn"}
Future<void> iTapElementWithKey(WidgetTester tester, String param1) async {
  final theFinder = find.byKey(Key(param1));
  expect(theFinder, findsOneWidget);

  tester.tap(theFinder);
  tester.pump();
}
