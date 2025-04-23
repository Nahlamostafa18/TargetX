import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:targetx/favourite/widget/FavoriteItemCard.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, String>> favoriteItems;

  const FavoritesScreen({super.key, required this.favoriteItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF7F7F9),
      body: favoriteItems.isEmpty
          ? const Center(child: Text("No favorites yet."))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return FavoriteItemCard(
            name: item["name"]!??"",
            image: item["image"]!,
            price: item["price"]!,
            rating: item["rating"]!,
            onDelete: () {
              // Handle deletion
            },
          );
        },
      ),
    );
  }
}
