import 'package:flutter/material.dart';

class ContactServiceScreen extends StatefulWidget {
  const ContactServiceScreen({super.key});

  @override
  State<ContactServiceScreen> createState() => _ContactServiceScreenState();
}

class _ContactServiceScreenState extends State<ContactServiceScreen> {
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    final message = _messageController.text.trim();

    if (message.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a message.')));
      return;
    }

    // هنا ممكن تبعت الرسالة للسيرفر أو تعمل أي حاجة تانية
    print('Message sent: $message');

    // امسح النص بعد الإرسال
    _messageController.clear();

    // تأكيد الإرسال
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Message sent successfully!')));
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: const Text(
          "Contact customer service",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              height: 160,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _messageController,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration.collapsed(
                  hintText: "Write...",
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _sendMessage,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C47FF),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Send", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}