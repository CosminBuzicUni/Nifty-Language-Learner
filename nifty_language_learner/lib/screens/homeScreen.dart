import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Welcome!"),
            ElevatedButton(
              onPressed: () {
                context.go('/languageScreen');
              },
              child: const Text("Languages"),
            ),
          ],
        ),
      ),
    );
  }
}
