import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  _LanguageBottomSheetState createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  String _selectedLanguage = 'English'; // اللغة الافتراضية

  void _changeLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
    // يمكنك إضافة كود لتغيير اللغة هنا (مثلًا باستخدام flutter_localizations)
    Navigator.pop(context); // إغلاق الصفحة بعد التغيير
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('English'),
              trailing:
              _selectedLanguage == 'English'
                  ? const Icon(Icons.check)
                  : null, // إظهار الأيقونة إذا كانت اللغة المختارة هي الإنجليزية
              onTap: () => _changeLanguage('English'),
            ),
            ListTile(
              title: const Text('Arabic'),
              trailing:
              _selectedLanguage == 'Arabic'
                  ? const Icon(Icons.check)
                  : null, // إظهار الأيقونة إذا كانت اللغة المختارة هي العربية
              onTap: () => _changeLanguage('Arabic'),
            ),
          ],
        ),
      ),
    );
  }
}