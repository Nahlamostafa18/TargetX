import 'package:flutter/material.dart';

/// Terms and Conditions Screen
class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '1. Acceptance of Terms',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement.',
            ),
            SizedBox(height: 16),
            Text(
              '2. Privacy Policy',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Your privacy is important to us. Please review our Privacy Policy for details on how we collect, use, and share your information.',
            ),
            SizedBox(height: 16),
            Text(
              '3. User Obligations',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'You agree not to misuse the app and to comply with all applicable laws regarding online conduct and content.',
            ),
            SizedBox(height: 16),
            Text(
              '4. Limitation of Liability',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'We shall not be liable for any indirect, incidental, or consequential damages arising out of your use of the app.',
            ),
            SizedBox(height: 16),
            Text(
              '5. Changes to Terms',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'We may revise these terms at any time by updating this document. Continued use constitutes acceptance of any new terms.',
            ),
          ],
        ),
      ),
    );
  }
}
