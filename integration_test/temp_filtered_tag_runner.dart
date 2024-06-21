    // GENERATED CODE - DO NOT MODIFY BY HAND
  import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import './step/the_app_is_running.dart';
import './step/i_login_with_email_and_password.dart';
import './step/i_goto_totalnumber_page.dart';
import './step/i_goto_playdice_page.dart';
import './step/i_see_text.dart';
import './step/i_see_icon.dart';
import './step/i_tap_icon.dart';
import './step/i_dont_see_text.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import './step/the_header_is_verified.dart';
import './step/i_see_element_with_key.dart';
import './step/i_enter_into_input_field.dart';
import './step/i_see_enabled_elevated_button.dart';
import './step/i_tap_element_with_key.dart';
import './step/i_see_page_with_title.dart';
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
    }, tags: ['tag1']);

});

  group('''Counter Page -''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await iLoginWithEmailAndPassword(tester, 'vicky@test.com', '000000');
    }


    testWidgets('''Number could add normally''', (tester) async {
      await bddSetUp(tester);
      await iTapIcon(tester, Icons.add);
      await iSeeText(tester, '1');
      await iDontSeeText(tester, '0');
    }, tags: ['tag1', 'tag2', 'tag3']);

});

  group('''Home Screen Validates and then Login''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
    }


    testWidgets('''Login when username and password are in specified format''',
        (tester) async {
      await bddSetUp(tester);
      await iSeeElementWithKey(tester, "LoginUserName");
      await iSeeElementWithKey(tester, "LoginPwd");
      await iSeeElementWithKey(tester, "LoginBtn");
      await iEnterIntoInputField(tester, "vicky@test.com", 0);
      await iEnterIntoInputField(tester, "000000", 1);
      await iSeeEnabledElevatedButton(tester);
      await iTapElementWithKey(tester, "LoginBtn");
      await iSeePageWithTitle(tester, "Flutter Demo Counter Page");
    }, tags: ['tag1', 'tag2']);

});

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
