import 'package:flutter/material.dart';
import 'package:pinkpawscat/constants/color_constants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.pink, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// Background
          SizedBox.expand(
            child: Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
          ),

          /// Foreground content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 150),
                const Spacer(flex: 1),

                /// Full Name
                TextField(
                  controller: nameController,
                  decoration: _inputDecoration("Full Name"),
                ),
                const SizedBox(height: 16),

                /// Mobile
                TextField(
                  controller: mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: _inputDecoration("Mobile Number"),
                ),
                const SizedBox(height: 16),

                /// Email
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration("Email Address"),
                ),
                const SizedBox(height: 16),

                /// Password
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: _inputDecoration("Password"),
                ),
                const SizedBox(height: 16),

                /// Confirm Password
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: _inputDecoration("Confirm Password"),
                ),

                const Spacer(flex: 1),

                /// Signup Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      debugPrint("Signup tapped");
                      debugPrint("Name: ${nameController.text}");
                      debugPrint("Mobile: ${mobileController.text}");
                      debugPrint("Email: ${emailController.text}");
                    },
                    child: Image.asset(
                      'assets/images/signupbtn.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
