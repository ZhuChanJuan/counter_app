// We must add this file for all integration test cases, then use it in the flutter drive command like :
// flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart -d chrome

import 'package:integration_test/integration_test_driver.dart';

Future<void> main() => integrationDriver();
