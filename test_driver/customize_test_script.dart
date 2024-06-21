import 'package:webdriver/async_io.dart';
import 'dart:io';
// import 'dart:convert';

Future<void> main() async {
  // Create WebDriver instance
  WebDriver driver = await createDriver(
    uri: Uri.parse(
        'http://localhost:4444/wd/hub/'), // Replace with your WebDriver server URI
    desired: {
      'browserName': 'chrome',
      'goog:chromeOptions': {
        'args': ['--headless', '--disable-gpu']
      }
    },
  );

  // Get the session ID
  String sessionId = driver.id;
  print('WebDriver session ID: $sessionId');

  // Run your Flutter drive test
  ProcessResult result = await Process.run(
    'flutter',
    [
      'drive',
      '--target=test_driver/integration_test.dart',
      '--driver=integration_test/counter_test.dart',
      '-d',
      'chrome'
    ],
  );

  print(result.stdout);
  print(result.stderr);

  // Close the WebDriver session
  await driver.quit();
}
