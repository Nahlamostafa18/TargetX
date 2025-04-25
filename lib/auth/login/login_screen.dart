import 'package:flutter/material.dart';
import 'package:targetx/layout/Layout_Screen.dart';
import 'package:targetx/shared/widget/CustomButton.dart';

import '../forgetpassword/forget_pass_screen.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage(
            "assets/images/logo.png",
          ),
          // fit: BoxFit.c,
        ),
      ),
      height: 150,
      width: 150,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Welcome back",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Log in to continue shopping",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(height: 5),
                  const SizedBox(height: 20),
                  TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: "  Enter your email",
                      hintStyle: const TextStyle(fontSize: 14),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: const Icon(Icons.email, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    textAlign: TextAlign.left,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "  Password",
                      hintStyle: const TextStyle(fontSize: 14),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: const Icon(Icons.lock, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          const Text("Remember me",
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ForgotPasswordScreen();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Forget password ?",
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SocialLoginButton(
                    image: "assets/images/google.png",
                    text: "Login with Google",
                    width: 25,
                    containerHeight: 40,
                    containerWidth: 40,
                  ),
                  const SizedBox(height: 10),
                  const SocialLoginButton(
                    image: "assets/images/facebook.png",
                    text: "Login with Facebook",
                    width: 15,
                    containerHeight: 35,
                    containerWidth: 35,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      title: "Login",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LayoutScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignUpScreen();
                          },
                        ),
                      );
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: "New Member? ",
                        style: TextStyle(fontSize: 14),
                        children: [
                          TextSpan(
                            text: "Register now",
                            style: TextStyle(fontSize: 14, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final String image;
  final String text;
  final double width;
  final double containerWidth;
  final double containerHeight;

  const SocialLoginButton({
    super.key,
    required this.image,
    required this.text,
    required this.width,
    required this.containerHeight,
    required this.containerWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: containerHeight,
            width: containerWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
              ),
            ),
          ),
          SizedBox(width: width),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
