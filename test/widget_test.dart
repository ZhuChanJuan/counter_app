// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:counter_app/screens/counter.dart';
import 'package:counter_app/screens/number_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// this file could run successfully with command : flutter test test/widget_test.dart

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(const MyApp());
    // since i added another homepage for the app, so i change the pump widget
    await tester.pumpWidget(const MaterialApp(
      home: CounterScreen(title: 'Flutter Demo Counter Page'),
    ));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    // await tester.tap(find.byKey(const ValueKey('increment_btn')));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('CounterScreen forward to NumberDisplayScreen test',
      (WidgetTester tester) async {
    // Build the CounterScreen widget
    await tester.pumpWidget(
      const MaterialApp(
        home: CounterScreen(title: 'Test Counter'),
      ),
    );

    // Tap the forward button
    await tester.tap(find.byKey(const Key('ForwardToTotalNumberScreen')));
    await tester.pumpAndSettle();

    // Verify that the NumberDisplayScreen is pushed to the navigator
    expect(find.byType(NumberDisplayScreen), findsOneWidget);
  });
}
