import 'package:flutter/material.dart';
import 'package:gchat/pages/welcome_screen.dart'; // Replace with your app name

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Set a delay of 3 seconds (3000 milliseconds)
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the WelcomeScreen after 3 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Image.asset(
          'assets/images/splash_logo.png', // Path to the splash screen image
          width: 200, // Set the width of the image
          height: 200, // Set the height of the image
          fit: BoxFit.cover, // Adjust the image to fit the space
        ),
      ),
    );
  }
}
