import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.width / 1.5,
        child: Image.asset('assets/images/Instagram-logo.png'),
      ),
    ));
  }
}
