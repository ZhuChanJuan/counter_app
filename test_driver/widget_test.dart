// This is a testing file to check whether widget test cases could use flutter_driver to run with UI
// The command like : flutter drive test_driver/widget.dart -d chrome, then the widget_test.dart will be executed
// But the fact is test cases in the widget_test.dart file all failed with package issue

import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart' as fdr;
import 'package:flutter_test/flutter_test.dart';

import 'package:counter_app/main.dart';
// import 'package:webdriver/async_io.dart';

void main() {
  group('Vicky test - ', () {
    late fdr.FlutterDriver driver;

    // connect to the Flutter driver before running the tests
    setUpAll(() async {
      driver = await fdr.FlutterDriver.connect();
    });

    // close the flutterDriver after the tests have finished
    tearDownAll(() async {
      await driver.close();
    });
    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

//     // Create a SemanticsHandle variable
//     late SemanticsHandle handle;

// // Wrap the remaining test code in a try-finally block
//     try {
      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);

      // Assign the SemanticsHandle
      //   handle = tester.ensureSemantics();
      // } finally {
      //   // Dispose the SemanticsHandle at the end of the test
      //   handle.dispose();
      // }
    });

    // testWidgets('Forward to homepage test', (tester) async {
    //   await tester.pumpWidget(const MyApp());

    //   // verify we could find the forward icon
    //   final fwdIcon = find.byKey(const Key('ForwardToTotalNumberScreen'));
    //   expect(fwdIcon, findsOneWidget);

    //   final appBarFinder = find.text('Total Number');
    //   expect(appBarFinder, findsNothing);

    //   await tester.tap(fwdIcon);
    //   await tester.pumpAndSettle();

    //   expect(appBarFinder, findsOneWidget);
    // });

    // test('added case for edge browser', () async {
    //   final driver = await createDriver(
    //     desired: {
    //       Capabilities.browserName: 'edge',
    //       // Capabilities.browserName: 'firefox',
    //     },
    //   );
    //   // Navigate to your Flutter web app
    //   // await driver.get('https://pulse-nprd.wedopulse.com/uat/my/welcome');
    //   await driver.get('https://flutter.dev');
    //   Future.delayed(const Duration(seconds: 2));
    //   await driver.quit();

    //   // Your test code here
    //   // Find elements, interact with the app, perform assertions, etc.
    // });
  });
}
