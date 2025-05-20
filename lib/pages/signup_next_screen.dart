import 'package:flutter/material.dart';

class SignupNextScreen extends StatelessWidget {
  const SignupNextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture
            GestureDetector(
              onTap: () {
                // Open image picker (to be implemented)
              },
              child: const CircleAvatar(
                radius: 50,
                child: Icon(Icons.add_a_photo, size: 30),
              ),
            ),
            const SizedBox(height: 20),
            // Name Input
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 20),
            // Password Input
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                suffixIcon: Icon(Icons.visibility_off),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            // Confirm Password Input
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                suffixIcon: Icon(Icons.visibility_off),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            // Complete Button
            ElevatedButton(
              onPressed: () {
                // Validate and navigate (to be implemented)
              },
              child: const Text('Complete'),
            ),
          ],
        ),
      ),
    );
  }
}
