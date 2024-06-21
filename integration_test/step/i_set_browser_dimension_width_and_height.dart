import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I set browser dimension width {1000} and height {900}
Future<void> iSetBrowserDimensionWidthAndHeight(
    WidgetTester tester, double width, double height) async {
  // this can only change the content's size not the browser's
  // await tester.binding.setSurfaceSize(Size(width, height));

// try to get screen width and height
  // tester.binding.window.physicalSize;
  print('>>> devicePixelRatio : ${tester.view.devicePixelRatio}');
  print(
      '>>> test the platformDispatcher : ${tester.platformDispatcher.platformBrightness.toString()}');

  final Size screenSize = tester.view.physicalSize;
  final double screenWidth = screenSize.width;
  final double screenHeight = screenSize.height;

  print('>>> Screen width: $screenWidth');
  print('>>> Screen height: $screenHeight');

  // the output would be :
  // >>> devicePixelRatio : 2
  // >>> test the platformDispatcher : Brightness.light
  // >>> Screen width: 3456
  // >>> Screen height: 1814

// try to update screen width and height but failed
  // ScreenUtil.init();
  // ScreenUtil().setWidth(540);
  // ScreenUtil().setHeight(700);
  // final newScreenSize = tester.view.physicalSize;
  // final double newScreenWidth = newScreenSize.width;
  // final double newScreenHeight = newScreenSize.height;

  // print('>>> New Screen width: $newScreenWidth');
  // print('>>> New Screen height: $newScreenHeight');

// reset the width and height to default one
}
