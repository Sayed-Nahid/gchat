import 'package:flutter/material.dart';
import 'package:gchat/pages/splash_screen.dart'; // Replace with your app name

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'G-Chat',
      theme: ThemeData.dark().copyWith(
        // Customize the dark theme further if needed
        scaffoldBackgroundColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Square-ish corners
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            backgroundColor: Colors.blue[800], // Darker blue for buttons
            elevation: 5, // Increased weight (shadow)
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Set SplashScreen as the initial screen
    );
  }
}
