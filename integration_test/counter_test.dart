// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

@Tags(['integration'])
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import './step/the_app_is_running.dart';
import './step/i_login_with_email_and_password.dart';
import './step/i_see_text.dart';
import './step/i_see_icon.dart';
import './step/i_tap_icon.dart';
import './step/i_dont_see_text.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('''Counter Page -''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await iLoginWithEmailAndPassword(tester, 'vicky@test.com', '000000');
    }

    testWidgets('''Initial text fields are correct''', (tester) async {
      await bddSetUp(tester);
      await iSeeText(tester, 'You have pushed the button this many times:');
      await iSeeText(tester, '0');
      await iSeeIcon(tester, Icons.add);
    });
    testWidgets('''Number could add normally''', (tester) async {
      await bddSetUp(tester);
      await iTapIcon(tester, Icons.add);
      await iSeeText(tester, '1');
      await iDontSeeText(tester, '0');
    }, tags: ['tag1', 'tag2', 'tag3']);
    testWidgets('''Forworad icon work well''', (tester) async {
      await bddSetUp(tester);
      await iTapIcon(tester, Icons.add);
      await iTapIcon(tester, Icons.arrow_forward);
      await iSeeText(tester, 'Total Number');
      await iSeeText(tester, 'The number is 1');
      await iSeeText(tester, 'Dice Screen');
    }, tags: ['tag2', 'tag4']);
  });
}
