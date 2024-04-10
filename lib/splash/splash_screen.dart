import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: Image.asset(
              "assets/images/ic_rounded_logo.png",
              width: 100,
            ),
          ),
        ]),
      ),
    );
  }
}
