// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'steps/the_app_is_running.dart';
import 'steps/i_see_text.dart';
import 'steps/i_see_icon.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('''Random Dice Page -''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
    }

    testWidgets('''Default picture and text display normally''',
        (tester) async {
      await bddSetUp(tester);
      await iSeeText(tester, 'Play Dice');
      await iSeeIcon(tester, Icons.play_arrow);
    });
  });
}
