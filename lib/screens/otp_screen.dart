// Importing necessary Flutter material components.
import 'dart:async';
import 'package:flutter/material.dart';
// Importing the HomeScreen to navigate after successful OTP verification.
import 'package:ration_now/screens/homescreen.dart';

// Defining OtpScreen as a StatefulWidget to handle dynamic changes.
class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.number,
  });
  final String number;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

// State class for OtpScreen.
class _OtpScreenState extends State<OtpScreen> {
  // Variables to manage the countdown timer for OTP.
  int minutes = 4;
  int seconds = 0;
  late Timer timer;

  // Method to handle tap events outside the TextField to lose focus.
  void handleTap() {
    FocusScope.of(context).unfocus();
  }

  // Method to handle 'CONTINUE' button click, navigating to HomeScreen.
  void onClickContinue() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const HomeScreen(),
      ),
    );
  }

  // Method to navigate back to the previous screen.
  void onClickEdit() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    // Setting up a periodic timer to update the countdown every second.
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else if (minutes > 0) {
          minutes--;
          seconds = 59;
        } else {
          // Cancel the timer when countdown reaches zero.
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer to avoid memory leaks.
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Main content of the screen, structured in a column.
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          const Text('OTP', style: TextStyle(fontSize: 20)),
          // TextField for OTP input.
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'OTP',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
          ),
          // Displaying the countdown timer.
          Text(
            'wait for $minutes:${seconds < 10 ? '0$seconds' : '$seconds'} minutes',
            style: const TextStyle(fontSize: 14),
          ),
          // Row to display the phone number and 'Edit' button.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.number,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: onClickEdit,
                child: const Text(
                  'Edit',
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );

    // Building the main Scaffold of the OTP screen.
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: handleTap,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    // Welcome text and placeholder images.
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 28,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/rashannow.png',
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(height: 12),
                    Image.asset(
                      'assets/images/rashanow2.png',
                      height: 40,
                      width: 250,
                    ),
                    // Adding the main content.
                    content,
                    // 'CONTINUE' button.
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green[800]),
                          shape: const MaterialStatePropertyAll(
                            ContinuousRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        onPressed: onClickContinue,
                        child: const Text(
                          'CONTINUE',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Footer text regarding privacy policy and terms of service.
                    const SizedBox(
                      width: 250,
                      child: Text(
                        'By continuing, you agree to accept our Privacy Policy & Terms of Service',
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
