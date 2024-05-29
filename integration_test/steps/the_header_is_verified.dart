import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

/// Usage: The {'login'} header is verified
Future<void> theHeaderIsVerified(WidgetTester tester, String scenario) async {
  await screenMatchesGolden(tester, scenario);
}
