// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import './step/the_app_is_running.dart';
import './step/i_login_with_email_and_password.dart';
import './step/i_goto_totalnumber_page.dart';
import './step/i_dont_see_text.dart';
import './step/i_tap_icon.dart';
import './step/i_see_text.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('''Total Number Page -''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await iLoginWithEmailAndPassword(tester, 'vicky@test.com', '000000');
      await iGotoTotalnumberPage(tester);
    }
    testWidgets('''Forward icon works well''', (tester) async {
      await bddSetUp(tester);
      await iDontSeeText(tester, 'Random Dice Page');
      await iTapIcon(tester, Icons.arrow_forward_ios_rounded);
      await iSeeText(tester, 'Random Dice Page');
    }, tags: ['tag1']);
  });
}
