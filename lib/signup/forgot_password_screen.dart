import 'package:flutter/material.dart';
import 'package:crud_app/signup/login_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color set to white
      appBar: AppBar(
        title: Text('Forgot Password'),
        backgroundColor: Colors.blue, // AppBar color set to blue
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Heading
                Text(
                  'Enter your email to reset your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(height: 40),

                // Email Field
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black), // Label color
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue), // Focused border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey), // Normal state border color
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Send Reset Email Button
                ElevatedButton(
                  onPressed: () {
                    // Handle password reset logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Password reset link sent!')),
                    );

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                    padding: EdgeInsets.all(16),
                  ),
                  child: Text(
                    'Send Reset Link',
                    style: TextStyle(color: Colors.white), // Button text color
                  ),
                ),
                SizedBox(height: 16),

                // Back to Login Button
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()), // Direct navigation to LoginScreen
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                    side: BorderSide(color: Colors.blue), // Border color
                  ),
                  child: Text(
                    'Back to Login',
                    style: TextStyle(color: Colors.blue), // Text color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
