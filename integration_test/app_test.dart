import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:counter_app/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      // Load app widget.
      await tester.pumpWidget(const MyApp());

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      // Finds the floating action button to tap on.
      final fab = find.byKey(const Key('increment_btn'));

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Forward to homepage test', (tester) async {
      await tester.pumpWidget(const MyApp());

      // verify we could find the forward icon
      final fwdIcon = find.byKey(const Key('ForwardToTotalNumberScreen'));
      expect(fwdIcon, findsOneWidget);

      final appBarFinder = find.text('Total Number');
      expect(appBarFinder, findsNothing);

      await tester.tap(fwdIcon);
      await tester.pumpAndSettle();

      expect(appBarFinder, findsOneWidget);
    });
  });
}