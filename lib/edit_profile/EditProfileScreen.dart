import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({
    super.key,
    required String initialName,
    required String initialPhone,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteSections = [
      'Electronics',
      'Perfumes',
      'Smart Watches',
      'Fabrics',
      'Smart Home',
      'Clothes',
      'Make Up',
      'Super Market',
      'Personal Care',
      'The Kitchen',
      'Games',
      'Children',
      'Sports',
      'School Tools',
      'Books',
    ];

    // Controllers for the text fields
    final _nameController = TextEditingController();
    final _phoneController = TextEditingController();
    final _locationController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Modify Personal Data'),
        actions: const [Icon(Icons.arrow_forward_ios)],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/user_avatar.png'),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Mobile number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Location',
                  prefixIcon: Icon(Icons.location_on_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Favorite Sections",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                favoriteSections.map((section) {
                  return GestureDetector(
                    onTap: () {
                      // عند الضغط على أي قسم مفضل، سننتقل إلى الصفحة الخاصة به
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => FavoriteSectionPage(section: section),
                        ),
                      );
                    },
                    child: Chip(
                      label: Text(section),
                      backgroundColor: Colors.grey.shade200,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Changes saved")),
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Save Modifications",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text("Cancel"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// صفحة مخصصة للقسم المفضل الذي يتم الضغط عليه
class FavoriteSectionPage extends StatelessWidget {
  final String section;

  const FavoriteSectionPage({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(section), backgroundColor: Colors.deepPurple),
      body: Center(
        child: Text(
          'Welcome to the $section page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}