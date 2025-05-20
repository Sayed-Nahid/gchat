import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isPhoneSelected = true;
  String? selectedCountry;
  String phoneOrEmail = '';
  bool showSendButton = false;
  bool showVerificationField = false;

  final Map<String, String> countryCodes = {
    'Bangladesh': '+880',
    'Australia': '+61',
    'USA': '+1',
  };

  TextEditingController phoneEmailController = TextEditingController();
  TextEditingController verificationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedCountry = 'Bangladesh';
    phoneEmailController.addListener(_handleInputChange);
  }

  void _handleInputChange() {
    final input = phoneEmailController.text.trim();
    bool shouldShowSend;

    if (isPhoneSelected) {
      shouldShowSend = input.length >= 7 && RegExp(r'^\+\d+').hasMatch(input);
    } else {
      shouldShowSend = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
          .hasMatch(input);
    }

    setState(() {
      showSendButton = shouldShowSend;
      if (!showSendButton) showVerificationField = false;
    });
  }

  void _onSendPressed() {
    setState(() {
      showVerificationField = true;
    });
  }

  void _insertCountryCodeIfNeeded() {
    if (isPhoneSelected && selectedCountry != null) {
      String code = countryCodes[selectedCountry!]!;
      final currentText = phoneEmailController.text;
      if (currentText.isEmpty ||
          RegExp(r'^\+\d{1,4}$').hasMatch(currentText)) {
        phoneEmailController.text = code;
        phoneEmailController.selection = TextSelection.fromPosition(
          TextPosition(offset: code.length),
        );
      }
    }
  }

  @override
  void dispose() {
    phoneEmailController.dispose();
    verificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labelText = isPhoneSelected ? 'Phone Number' : 'Email Address';

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 20),
              Text(
                'Sign Up',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),

              // Country/Region Dropdown (always visible)
              DropdownButtonFormField<String>(
                value: selectedCountry,
                decoration: InputDecoration(
                  labelText: 'Country/Region',
                  labelStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                dropdownColor: Colors.grey[900],
                iconEnabledColor: Colors.white,
                items: countryCodes.keys
                    .map((country) => DropdownMenuItem(
                  value: country,
                  child: Text(
                    country,
                    style: const TextStyle(color: Colors.white),
                  ),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                    _insertCountryCodeIfNeeded();
                  });
                },
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: phoneEmailController,
                keyboardType: isPhoneSelected
                    ? TextInputType.phone
                    : TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: labelText,
                  labelStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),

              if (showSendButton)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _onSendPressed,
                    child: const Text(
                      'Send',
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ),
                ),

              if (showVerificationField)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: verificationController,
                    decoration: InputDecoration(
                      labelText: 'Verification Code',
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                  ),
                ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  setState(() {
                    isPhoneSelected = !isPhoneSelected;
                    phoneEmailController.clear();
                    verificationController.clear();
                    showSendButton = false;
                    showVerificationField = false;
                    _insertCountryCodeIfNeeded();
                  });
                },
                child: Text(
                  isPhoneSelected
                      ? 'Use Email Instead'
                      : 'Use Phone Number Instead',
                  style: const TextStyle(color: Colors.white70),
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  // Handle next action
                },
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 120, vertical: 18),
                  backgroundColor: const Color(0xFF81D8D0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text(
                  'Already have an account? Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
