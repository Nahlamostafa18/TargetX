import 'package:flutter/material.dart';

import '../auth/login/login_screen.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/image1.png",
      "title": "Browse endless products from top brands.",
      "subtitle": "To your desire"
    },
    {
      "image": "assets/images/image2.png",
      "title": "Shop anytime, anywhere with ease.",
      "subtitle": "To your destination"
    },
    {
      "image": "assets/images/image3.png",
      "title": "Enjoy fast delivery to your doorstep.",
      "subtitle": "To your shopping trip"
    },
  ];

  void goNext() {
    if (currentPage < onboardingData.length - 1) {
      _controller.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      goToLogin();
    }
  }

  void goToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // <-- خلفية بيضاء
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: goToLogin,
                child: const Text("Skip", style: TextStyle(color: Colors.black)),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                  image: onboardingData[index]['image']!,
                  title: onboardingData[index]['title']!,
                  subtitle: onboardingData[index]['subtitle']!,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                    (index) => buildDot(index),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: goNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                currentPage == onboardingData.length - 1
                    ? "Get Started"
                    : "Next",
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  final String image, title, subtitle;

  const OnboardContent({super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Expanded(child: Image.asset(image)),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
