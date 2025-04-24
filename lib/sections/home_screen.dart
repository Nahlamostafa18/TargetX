import 'package:flutter/material.dart';
import '../favourite/favorites_screen.dart';
import 'widgets/product_search_delegate.dart';

class HomeSectionScreen extends StatefulWidget {
  const HomeSectionScreen({super.key});

  @override
  State<HomeSectionScreen> createState() => _HomeSectionScreenState();
}

class _HomeSectionScreenState extends State<HomeSectionScreen> {
  final List<Map<String, String>> products = [
    {
      "name": "Chair",
      "price": "800",
      "image": "assets/images/chair.png",
    },
    {
      "name": "Lamp",
      "price": "400",
      "image": "assets/images/lamp.png",
    },
    {
      "name": "Table",
      "price": "1500",
      "image": "assets/images/table.png",
    },
    {
      "name": "Vase",
      "price": "250",
      "image": "assets/images/vase.png",
    },
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
        title: const Text("Home"),
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
                  builder: (_) => const FavoritesScreen(),
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      product["image"]!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        product["name"]!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text("${product["price"]} EGP",
                          style: const TextStyle(color: Colors.grey)),
                      IconButton(
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: isFav ? Colors.red : Colors.grey,
                        ),
                        onPressed: () => toggleFavorite(product),
                      )
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
