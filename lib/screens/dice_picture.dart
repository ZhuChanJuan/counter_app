import 'dart:math';

import 'package:flutter/material.dart';

Random random = Random();

int generateRandomNumber() {
  return random.nextInt(6) + 1;
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() {
    return _DiceScreenState();
  }
}

class _DiceScreenState extends State<DiceScreen>
    with SingleTickerProviderStateMixin {
  var _theImage = 'assets/dice-1.png';
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0.5, end: 1).animate(_controller);

    _changeDice();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changeDice() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    final num = generateRandomNumber();
    setState(() {
      _theImage = 'assets/dice-$num.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Dice Page'),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (ctx) {
        //             return const PlaceListScreen();
        //           },
        //         ),
        //       );
        //     },
        //     icon: const Icon(Icons.arrow_forward_rounded),
        //   ),
        // ],
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 50,
              ),
              width: 250,
              height: 250,
              child: RotationTransition(
                turns: _animation,
                child: Image.asset(
                  _theImage,
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _changeDice,
              icon: const Icon(
                Icons.play_arrow,
              ),
              label: Text(
                'Play Dice',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(160, 40),
                iconColor: Colors.green,
                backgroundColor: Colors.grey[150],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
