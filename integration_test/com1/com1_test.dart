import '../login_test_test.dart' as test1;
import '../counter_test.dart' as test2;

// I try to run this with command : flutter drive --driver=test_driver/integration_test.dart  -t integration_test/com1/com1_test.dart -d chrome
// but failed with error like :
// org-dartlang-app:/com1_test.dart:1:8: Error: Error when reading 'org-dartlang-app:/login_test_test.dart': File not found
// import '../login_test_test.dart' as test1;

void main() {
  test1.main();
  test2.main();
}
