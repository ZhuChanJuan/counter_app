import 'package:flutter_test/flutter_test.dart';

/// Usage: I see page with title {"Flutter Demo Counter Page"}
Future<void> iSeePageWithTitle(WidgetTester tester, String param1) async {
  expect(find.text(param1), findsOneWidget);
}
