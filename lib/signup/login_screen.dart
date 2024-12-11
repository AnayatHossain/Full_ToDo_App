import 'package:flutter/material.dart';
import 'package:crud_app/signup/signup_screen.dart';
import 'package:crud_app/screens/todo_list_screen.dart';
import 'package:crud_app/signup/forgot_password_screen.dart';

import 'forgot_password_screen.dart'; // Import ForgotPasswordScreen

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Changed background color to white
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                Column(
                  children: [
                    Icon(
                      Icons.hourglass_empty,
                      size: 60,
                      color: Colors.black, // Icon color changed to black
                    ),
                    SizedBox(height: 8),
                    Text(
                      "ToDo",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Text color changed to black
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),

                // Email Field
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black), // Label color changed to black
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue), // Border color changed to blue when focused
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey), // Border color for normal state
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Password Field
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black), // Label color changed to black
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue), // Border color changed to blue when focused
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey), // Border color for normal state
                    ),
                    suffixIcon: Icon(Icons.visibility_off, color: Colors.black), // Suffix icon color changed to black
                  ),
                ),
                SizedBox(height: 8),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Navigate to ForgotPasswordScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                      );
                    },
                    child: Text('Forgot Password?', style: TextStyle(color: Colors.black)), // Text color changed to black
                  ),
                ),

                SizedBox(height: 16),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TodoListScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color changed to blue
                    padding: EdgeInsets.all(16),
                  ),
                  child: Text('Log In', style: TextStyle(color: Colors.white)), // Text color changed to white
                ),
                SizedBox(height: 16),

                // Create Account Button
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                    side: BorderSide(color: Colors.blue), // Border color changed to blue
                  ),
                  child: Text('Create Account', style: TextStyle(color: Colors.blue)), // Text color changed to blue
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
