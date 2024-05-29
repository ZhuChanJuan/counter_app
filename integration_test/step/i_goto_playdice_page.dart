import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I goto 'PlayDice' page
Future<void> iGotoPlaydicePage(WidgetTester tester) async {
  final fwdBtn = find.byIcon(Icons.arrow_forward_ios_rounded);
  await tester.tap(fwdBtn);
  await tester.pumpAndSettle();
}
