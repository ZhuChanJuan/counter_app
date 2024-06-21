import 'dart:io';

import 'package:counter_app/screens/counter.dart';
import 'package:counter_app/screens/home.dart';
// import 'package:counter_app/screens/login.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/semantics.dart';

//just used for testing
final hostUrl = Platform.environment['VM_SERVICE_URL'];
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

void main() {
  // print(">>> hostURL : $hostUrl");
  // print(">>> settings : $settings");

  // required to support SemanticsBinding
  // WidgetsFlutterBinding.ensureInitialized();
  // add this line to render webeleent
  // SemanticsBinding.instance.ensureSemantics();
  runApp(const MyApp());
  // SemanticsBinding.instance.ensureSemantics();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const CounterScreen(title: 'Flutter Demo Counter Page'),
      // home: const HomeScreen(),
      // try to use route to manage different pages
      initialRoute: '/',
      routes: {
        '/': (ctx) => const HomeScreen(),
        '/counter': (ctx) =>
            const CounterScreen(title: 'Flutter Demo Counter Page'),
      },
    );
  }
}
