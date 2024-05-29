import 'package:counter_app/screens/login.dart';
import 'package:counter_app/screens/signup.dart';
// import 'package:counter_app/widgets/login_card.dart';
// import 'package:counter_app/widgets/signup_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login & Signup'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Login'),
              Tab(text: 'Signup'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // LoginCard(),
            // SignupCard(),
            LoginPage(),
            SignupPage(),
          ],
        ),
      ),
    );
  }
}
