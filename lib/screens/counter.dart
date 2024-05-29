import 'package:counter_app/screens/number_display.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key, required this.title});

  final String title;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            key: const Key('ForwardToTotalNumberScreen'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => NumberDisplayScreen(
                        number: _counter,
                      )));
            },
            icon: const Icon(
              Icons.arrow_forward,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const CircleAvatar(
            key: Key('CircleAvatarOnHomepage'),
            // backgroundColor: Colors.green,
            radius: 30,
            backgroundImage: AssetImage('assets/001.jpg'),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Provide a ValueKey to this button. This allows finding this
        // specific button inside the test suite, and tapping it.
        key: const ValueKey('increment_btn'),
        onPressed: _incrementCounter,
        tooltip: 'Increment_tooltip',
        child: const Icon(Icons.add),
      ),
    );
  }
}
