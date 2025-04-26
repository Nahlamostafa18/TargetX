import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text('FAQ'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FAQPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.phone_in_talk),
              title: const Text('Contact Support'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactSupportPage(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('Report an Issue'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReportIssuePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// صفحة الأسئلة الشائعة
class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FAQ')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Here are some frequently asked questions.\n\n'
              'Q: How to use the app?\n'
              'A: Just browse, add items to cart, and checkout.\n\n'
              'Q: Can I contact support?\n'
              'A: Yes, from the Help section.',
        ),
      ),
    );
  }
}

// صفحة التواصل مع الدعم
class ContactSupportPage extends StatelessWidget {
  const ContactSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Support')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'For support, please contact us via:\n\n'
              '- Email: support@example.com\n'
              '- Phone: +1234567890\n\n'
              'We are available 24/7.',
        ),
      ),
    );
  }
}

// صفحة الإبلاغ عن مشكلة
class ReportIssuePage extends StatelessWidget {
  const ReportIssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report an Issue')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Describe the issue:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Type your issue here...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // هنا تقدر ترسل المشكلة للسيرفر أو تبين رسالة نجاح
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Issue submitted. Thank you!')),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}