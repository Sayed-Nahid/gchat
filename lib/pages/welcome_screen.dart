import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import the LoginScreen
import 'signup_screen.dart'; // Import the SignUpScreen

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
            Text(
              'Welcome to G-Chat',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30), // Spacing between text and buttons
            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the SignUpScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 18), // Wider and taller
                backgroundColor: const Color(0xFF81D8D0), // Set button color to #81D8D0
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 18, color: Colors.white), // White text for contrast
              ),
            ),
            const SizedBox(height: 20), // Spacing between buttons
            // Sign In Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the LoginScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 18), // Wider and taller
                backgroundColor: const Color(0xFF81D8D0), // Set button color to #81D8D0
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(fontSize: 18, color: Colors.white), // White text for contrast
              ),
            ),
          ],
        ),
      ),
    );
  }
}
