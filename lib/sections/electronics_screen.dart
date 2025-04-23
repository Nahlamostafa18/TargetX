import 'package:flutter/material.dart';
import '../favourite/favorites_screen.dart';
import 'widgets/search_delegate.dart';

class ElectronicsScreen extends StatefulWidget {
  const ElectronicsScreen({super.key});

  @override
  State<ElectronicsScreen> createState() => _ElectronicsScreenState();
}

class _ElectronicsScreenState extends State<ElectronicsScreen> {
  final List<Map<String, String>> products = [
    {"name": "Smartphone", "price": "8500", "image": "assets/images/phone.png"},
    {"name": "Laptop", "price": "15000", "image": "assets/images/laptop.png"},
    {"name": "Headphones", "price": "1200", "image": "assets/images/headphones.png"},
    {"name": "Smart Watch", "price": "3000", "image": "assets/images/watch.png"},
  ];

  List<Map<String, String>> favoriteItems = [];

  void toggleFavorite(Map<String, String> product) {
    setState(() {
      if (favoriteItems.contains(product)) {
        favoriteItems.remove(product);
      } else {
        favoriteItems.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Electronics"),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: ProductSearchDelegate(
                    products: products,
                    favoriteItems: favoriteItems,
                    onToggleFavorite: toggleFavorite,
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FavoritesScreen(favoriteItems: favoriteItems),
                  ),
                );
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: GridView.builder(
        padding: const EdgeInsets.all(12),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 12,
    crossAxisSpacing: 12,
    childAspectRatio: 0.75,
    ),
    itemCount: products.length,
    itemBuilder: (context, index) {
    final product = products[index];
    final isFav = favoriteItems.contains(product);
    return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 2,
    child: Column(
    children: [
    Expanded(
    child: ClipRRect(
    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
    child: Image.asset(product["image"]!, fit: BoxFit.cover, width: double.infinity),
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8),
    child: Column(
    children: [
    Text(product["name"]!, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold)),
    const SizedBox(height: 4),
    Text("${product["price"]} EGP", style: const TextStyle(color: Colors.grey)),
    IconButton(
    icon: Icon(isFav ? Icons.favorite : Icons.favorite_border,
      color: isFav ? Colors.red : Colors.grey,
    ),
      onPressed: () => toggleFavorite(product),
    ),
    ],
    ),
    ),
    ],
    ),
    );
    },
        ),
    );
  }
}
