// This is a testing file to check whether widget test cases could use flutter_driver to run with UI
// The command like : flutter drive test_driver/widget.dart -d chrome, then the widget_test.dart will be executed
// But the fact is test cases in the widget_test.dart file all failed with package issue

import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:counter_app/main.dart' as app;

void main() {
  // enable flutter driver to interact with app during the tests (so the package is download and open on the emulator)
  enableFlutterDriverExtension();

  // can't use this since the main method not only including runApp()
  // app.main();
  runApp(const app.MyApp());
}
