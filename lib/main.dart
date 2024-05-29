import 'package:counter_app/screens/counter.dart';
import 'package:counter_app/screens/home.dart';
// import 'package:counter_app/screens/login.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/semantics.dart';

void main() {
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
