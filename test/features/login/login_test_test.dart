// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../steps/the_app_is_running.dart';
import '../../steps/i_see_text.dart';
import '../../steps/the_header_is_verified.dart';
import '../../steps/i_see_element_with_key.dart';
import '../../steps/i_enter_into_input_field.dart';
import '../../steps/i_see_enabled_elevated_button.dart';
import '../../steps/i_tap_element_with_key.dart';
import '../../steps/i_see_page_with_title.dart';

void main() {
  // this line is added manually since the test file generated in test folder doesn't have this line
//   If you're running the tests with `flutter drive`, please make sure your tests
// are in the `integration_test/` directory of your package and use
// `flutter test $path_to_test` to run it instead.
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('''Home Screen Validates and then Login''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
    }

    testWidgets('''Initial text fields are empty''', (tester) async {
      await bddSetUp(tester);
      await iSeeText(tester, 'Welcome Back');
      await iSeeText(tester, 'Username');
      await iSeeText(tester, 'Password');
    });
    // testGoldens('''The login header is purple''', (tester) async {
    //   await bddSetUp(tester);
    //   await theHeaderIsVerified(tester, 'login');
    // });
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
    });
  });
}
