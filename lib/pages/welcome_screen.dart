import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/images/logo.png', // Path to your logo image
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20), // Spacing between logo and text
            // Welcome message
            const Text(
              'Welcome to G-Chat',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20), // Spacing between text and buttons
            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                // Placeholder for Sign Up functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sign Up clicked')),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10), // Spacing between buttons
            // Sign In Button
            ElevatedButton(
              onPressed: () {
                // Placeholder for Sign In functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sign In clicked')),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
