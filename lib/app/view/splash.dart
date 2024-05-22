import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxHeight: 500, maxWidth: 500),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/Instagram-logo.png',
                height: 350,
              ).animate().fade(delay: 1.seconds).scale(delay: 1.seconds),
              // const SizedBox(height: 8),
              const Text(
                'Social Task',
                style: TextStyle(
                  fontFamily: 'Billabong',
                  fontSize: 30.0,
                ),
              ).animate().fade(delay: const Duration(seconds: 1)).scaleX(),
            ],
          ),
        ),
      ),
    );
  }
}
