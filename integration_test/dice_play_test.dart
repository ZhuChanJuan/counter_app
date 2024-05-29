// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import './step/the_app_is_running.dart';
import './step/i_login_with_email_and_password.dart';
import './step/i_goto_totalnumber_page.dart';
import './step/i_goto_playdice_page.dart';
import './step/i_see_text.dart';
import './step/i_see_icon.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('''Random Dice Page -''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await iLoginWithEmailAndPassword(tester, 'vicky@test.com', '000000');
      await iGotoTotalnumberPage(tester);
      await iGotoPlaydicePage(tester);
    }
    testWidgets('''Default picture and text display normally''', (tester) async {
      await bddSetUp(tester);
      await iSeeText(tester, 'Play Dice');
      await iSeeIcon(tester, Icons.play_arrow);
    });
  });
}
