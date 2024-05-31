// import 'package:flutter_driver/flutter_driver.dart';
// import 'package:test/test.dart';

import '../login_test_test.dart' as test1;
import '../counter_test.dart' as test2;

// i tried with command "flutter drive --driver=test_driver/integration_test.dart  -t integration_test/com1_test.dart -d chrome " to run the combination test suite , the result :
// the app will go back to the homepage after first test case finished, so we still need add initialization code for other test scenarios

// this is one test method which works like sh script, but a little more flexibility

// this could work well, but each test file can't share the same application instance
void main() {
  // Call your test functions here
  test1.main();
  test2.main();
}

// void main() {
//   group('Combination testing - ', () {
//     late FlutterDriver driver;

//     setUpAll(() async {
//       driver = await FlutterDriver.connect();
//       print('>>> driver : $driver');
//     });

//     tearDownAll(() async {
//       await driver.close();
//     });

//     // Call your test functions here
//     test1.main();
//     test2.main();
//   });
// }
