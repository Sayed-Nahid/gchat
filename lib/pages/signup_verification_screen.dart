import 'package:flutter/material.dart';

class SignupVerificationScreen extends StatelessWidget {
  const SignupVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Phone Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Country/Region Input
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Country/Region',
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
              readOnly: true,
              onTap: () {
                // Navigate to country selection screen (to be implemented)
              },
            ),
            const SizedBox(height: 20),
            // Phone Number Input
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                prefixText: '+',
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            // Send Code Button
            ElevatedButton(
              onPressed: () {
                // Send OTP (to be implemented)
              },
              child: const Text('Send Code'),
            ),
            const SizedBox(height: 20),
            // OTP Input
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter OTP',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            // Resend Code Button
            TextButton(
              onPressed: () {
                // Resend OTP (to be implemented)
              },
              child: const Text('Resend Code'),
            ),
            const SizedBox(height: 20),
            // Next Button
            ElevatedButton(
              onPressed: () {
                // Verify OTP and navigate (to be implemented)
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
