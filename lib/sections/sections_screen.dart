import 'package:flutter/material.dart';
import 'electronics_screen.dart';
import 'clothes_screen.dart';
import 'home_screen.dart';

class SectionsScreen extends StatelessWidget {
  const SectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sections"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              sectionCard(
                context,
                title: "Electronics",
                tags: ["Headphones", "Laptop", "Smart Watch"],
                image: 'images/electronics.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ElectronicsScreen()),
                  );
                },
              ),
              const SizedBox(height: 12),
              sectionCard(
                context,
                title: "Clothes",
                tags: ["Fabric", "Women", "Men", "Shoes"],
                image: 'images/clothes.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ClothesScreen()),
                  );
                },
              ),
              const SizedBox(height: 12),
              sectionCard(
                context,
                title: "Home",
                tags: ["Furniture", "Lights"],
                image: 'images/home.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeSectionScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionCard(
      BuildContext context, {
        required String title,
        required List<String> tags,
        required String image,
        VoidCallback? onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: tags.map((tag) => Chip(label: Text(tag))).toList(),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
