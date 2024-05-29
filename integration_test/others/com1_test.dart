import 'login_test_test.dart' as test1;
import 'counter_test.dart' as test2;

// i tried with command "flutter drive --driver=test_driver/integration_test.dart  -t integration_test/com1_test.dart -d chrome " to run the combination test suite , the result :
// the app will go back to the homepage after first test case finished, so we still need add initialization code for other test scenarios

// this is one test method which works like sh script, but a little more flexibility

void main() {
  test1.main();
  test2.main();
}
