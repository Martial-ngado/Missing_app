import 'package:flutter/material.dart';
import 'package:missing/views/login_screen.dart';  // Assuming this is the next screen

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to the next screen after 4 seconds
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()), // Replace with your next screen
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Center(
          child: Image.asset('assets/images/img_3.png'), // Your splash image
        ),
      ),
    );
  }
}
