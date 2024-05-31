# 1.Comments for files in this folder :

* **app.dart** ( the same with widget.dart), just use as the driver file for test case written by "test" and "flutter_driver" packages
* **integration_test.dart** : use as the driver file for test case written by "integration_test" package, mainly for the test file in "integration_folder"
* **widget**.dart ( the same with app.dart), just use as the driver file for test case written by "test" and "flutter_driver" packages, but mainly for "widget_test.dart"
* **widget_test**.dart : the test case wrote by "test" and "flutter_driver" packages, and it can't be executed successfully with command :
  * flutter test test_driver/widget_test.dart
  * flutter drive --target=test_driver/widget.dart   ( Error: Dart library 'dart:ui' is not available on this platform. )
  * flutter drive --target=test_driver/widget_test.dart -d chrome  ( Error:  **Test file not found: /Users/vickyzhu/FlutterProjects/counter_app/test_driver/widget_test_test.dart**)
  * flutter drive --target=test_driver/widget.dart -d chrome  ( Error: Dart library 'dart:ui' is not available on this platform. )
  * flutter drive --driver=test_driver/widget.dart --target=test_driver/widget_test.dart -d chrome  ( Error: Dart library 'dart:ui' is not available on this platform. )
