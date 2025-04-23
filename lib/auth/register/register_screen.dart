import 'package:flutter/material.dart';

import '../login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),

                const SizedBox(
                  height: 120,
                ),
                // Image.asset("images/img1.jpg"),
                const Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 2),
                const Center(
                  child: Text(
                    "sign in to continue shopping",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    hintText: "  Username",
                    hintStyle: const TextStyle(fontSize: 14),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: const Icon(Icons.person, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    hintText: "  Email",
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
                  decoration: InputDecoration(
                    hintText: "  Phone number",
                    hintStyle: const TextStyle(fontSize: 14),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: const Icon(Icons.phone, color: Colors.grey),
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
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    const Text(
                      "By checking the box you agree to our ",
                      style: TextStyle(fontSize: 10),
                    ),
                    const Text(
                      "Terms",
                      style: TextStyle(fontSize: 12, color: Colors.purple),
                    ),
                    const Text(" and ", style: TextStyle(fontSize: 12)),
                    const Text(
                      "Conditions.",
                      style: TextStyle(fontSize: 12, color: Colors.purple),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.deepPurple, Colors.blue],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(30),
                    child: const Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  },
                  child: const Center(
                    child: Text.rich(
                      TextSpan(
                        text: "Already a member? ",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: " Login",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
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
