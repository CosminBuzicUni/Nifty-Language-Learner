import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Welcome to Nifty Language Learner!"),
            ElevatedButton(
              onPressed: () {
                context.go('/credentials_screen');
              },
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
