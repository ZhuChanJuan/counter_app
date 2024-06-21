import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see text match {r'Deactive \((\d+\)\)'}
/// This method will search all text on the page
Future<void> iSeeTextMatch(WidgetTester tester, String partenString) async {
  // Find text widgets on the page
  final textFinder = find.byType(Text);

  // Get the widgets
  final widgets = tester.widgetList(textFinder);
  bool hasText = false;

  final pattern = RegExp(partenString);
  // if (pattern.hasMatch('Active (3)')) {
  //   print('>>> the partten works well');
  // }
  // if (pattern.hasMatch('Active 3')) {
  //   print('>>> the partten should change ');
  // }
  // Iterate over the text widgets and check for the desired pattern
  for (final textWidget in widgets) {
    if (textWidget is Text) {
      final text = textWidget.data ?? '';
      // print('>>> $text');

      // Use regular expressions to match the pattern 'Deactive \(\d+\)'
      if (pattern.hasMatch(text)) {
        print('>>> $text');
        hasText = true;
      }
    }
    // final text = textWidget.toStringShort();
    // print('>>> ${textWidget.key}');
    // print('>>> $textWidget : $text');
    // print('>>> ${textWidget.toStringShallow()}');
    // print('>>> ${textWidget.toStringDeep()}');
  }

  expect(hasText, true);
}
