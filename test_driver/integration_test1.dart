// We must add this file for all integration test cases, then use it in the flutter drive command like :
// flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart -d chrome

import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/common.dart';
import 'package:integration_test/integration_test_driver.dart';

// try this with command : flutter drive --driver=test_driver/integration_test1.dart -t integration_test/counter_test.dart -d chrome

Future<void> main() async {
  final FlutterDriver driver = await FlutterDriver.connect();

  // Capture and print the session ID before running the tests
  final sessionId = driver.webDriver.id;
  print('>>> The sessionID in main : $sessionId');
  print('>>> The driver : $driver');

  // Now you can perform any pre-test operations using the session ID
  controlChromeBeforeTests(sessionId);

  // Run the integration tests
  await integrationDriver1(driver: driver);

  // Perform any post-test operations using the session ID
  controlChromeAfterTests(sessionId);
}

Future<void> integrationDriver1({
  required FlutterDriver driver,
  Duration timeout = const Duration(minutes: 20),
  ResponseDataCallback? responseDataCallback = writeResponseData,
  bool writeResponseOnFailure = false,
}) async {
  // final FlutterDriver driver = await FlutterDriver.connect();
  print('>>> The sessionID in integrationDriver1 : ${driver.webDriver.id}');
  // print('>>> The driver : $driver');

  final hostUrl = Platform.environment['VM_SERVICE_URL'];
  print(">>> the hostURL : $hostUrl");

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
  print(">>> the settings : $settings");

  final String jsonResult = await driver.requestData(null, timeout: timeout);
  print('>>> The jsResult: $jsonResult');

  final Response response = Response.fromJson(jsonResult);

  await driver.close();

  if (response.allTestsPassed) {
    print('All tests passed.');
    if (responseDataCallback != null) {
      await responseDataCallback(response.data);
    }
    exit(0);
  } else {
    print('Failure Details:\n${response.formattedFailureDetails}');
    if (responseDataCallback != null && writeResponseOnFailure) {
      await responseDataCallback(response.data);
    }
    exit(1);
  }
}

void controlChromeBeforeTests(String sessionId) {
  // Implement your logic to control Chrome using the session ID before tests
  print('>>> Controlling Chrome before tests with session ID: $sessionId');
  // Example: You can send commands to the WebDriver session here
}

void controlChromeAfterTests(String sessionId) {
  // Implement your logic to control Chrome using the session ID after tests
  print('>>> Controlling Chrome after tests with session ID: $sessionId');
  // Example: You can send commands to the WebDriver session here
}
