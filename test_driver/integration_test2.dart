import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/common.dart';

// try this with command : flutter drive --driver=test_driver/integration_test2.dart -t integration_test/counter_test.dart -d chrome

Future<void> main() async {
  // Establish a connection to the Flutter Driver
  final FlutterDriver driver = await FlutterDriver.connect();

  // Capture and print the session ID
  final sessionId = driver.webDriver.id;
  print('>>> The sessionID in main: $sessionId');
  print('>>> The driver: $driver');

  // Perform any pre-test operations using the session ID
  await controlChromeBeforeTests(sessionId);

  // Run the integration tests
  await runTests(driver);

  // Perform any post-test operations using the session ID
  await controlChromeAfterTests(driver);

  // Close the driver connection
  await driver.close();
}

Future<void> controlChromeBeforeTests(String sessionId) async {
  // Implement your logic to control Chrome using the session ID before tests
  // Example operation: Navigate to a specific URL

  print('>>> Controlling Chrome before tests with session ID: $sessionId');
  // Example: You can send commands to the WebDriver session here
}

Future<void> controlChromeAfterTests(FlutterDriver driver) async {
  // Implement your logic to control Chrome using the session ID after tests
  print(
      '>>> Controlling Chrome after tests with session ID: ${driver.webDriver.id}');

// this code can't be executed, so i copy one to the runTests method
  const url = 'https://www.baidu.com';
  await driver.webDriver.get(url);
  print('>>> Navigated to $url');
  // Example: You can send commands to the WebDriver session here
}

Future<void> runTests(FlutterDriver driver) async {
  final hostUrl = Platform.environment['VM_SERVICE_URL'];
  print(">>> the hostURL: $hostUrl");

  final Map<String, dynamic> settings = <String, dynamic>{
    'support-timeline-action':
        Platform.environment['SUPPORT_TIMELINE_ACTION'] == 'true',
    'session-id': Platform.environment['DRIVER_SESSION_ID'],
    'session-uri': Platform.environment['DRIVER_SESSION_URI'],
    'session-spec': Platform.environment['DRIVER_SESSION_SPEC'],
    'android-chrome-on-emulator':
        Platform.environment['ANDROID_CHROME_ON_EMULATOR'] == 'true',
    'session-capabilities': Platform.environment['DRIVER_SESSION_CAPABILITIES'],
  };
  print(">>> the settings: $settings");

  final String jsonResult = await driver.requestData(null);
  print('>>> The jsResult: $jsonResult');

  final Response response = Response.fromJson(jsonResult);

// this is just one sample, but can't be executed with log : 'No widgets found at Offset(...)
  const url = 'https://www.baidu.com';
  await driver.webDriver.get(url);
  print('>>> runTests : Navigated to $url');

  if (response.allTestsPassed) {
    print('All tests passed.');
    exit(0);
  } else {
    print('Failure Details:\n${response.formattedFailureDetails}');
    exit(1);
  }
}
