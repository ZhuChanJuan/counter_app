import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I login with email {'vicky@test.com'} and password {'000000'}
Future<void> iLoginWithEmailAndPassword(
    WidgetTester tester, String email, String password) async {
  final nameFinder = find.byKey(const Key('LoginUserName'));
  final pwdFinder = find.byKey(const Key('LoginPwd'));
  final btnFinder = find.byKey(const Key('LoginBtn'));
  expect(nameFinder, findsOneWidget);
  expect(pwdFinder, findsOneWidget);
  expect(btnFinder, findsOneWidget);

  await tester.enterText(nameFinder, email);
  await tester.enterText(pwdFinder, password);
  await tester.tap(btnFinder);
  await tester.pumpAndSettle();

  expect(find.text('Flutter Demo Counter Page'), findsOneWidget);
}
