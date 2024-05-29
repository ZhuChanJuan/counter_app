import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I goto 'TotalNumber' page
Future<void> iGotoTotalnumberPage(WidgetTester tester) async {
  final fwdBtn = find.byIcon(Icons.arrow_forward);
  await tester.tap(fwdBtn);
  await tester.pumpAndSettle();
}
