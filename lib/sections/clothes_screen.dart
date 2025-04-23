import 'package:flutter/material.dart';

class ClothesScreen extends StatefulWidget {
  const ClothesScreen({super.key});

  @override
  State<ClothesScreen> createState() => _ClothesScreenState();
}

class _ClothesScreenState extends State<ClothesScreen> {
  final List<Map<String, String>> _clothes = [
    {
      "name": "Men's Jacket",
      "price": "850",
      "image": "assets/images/clothes/.png"
    },
    {
      "name": "Women's Dress",
      "price": "1200",
      "image": "assets/images/clothes/.png"
    },
    {
      "name": "Kid's T-shirt",
      "price": "300",
      "image": "assets/images/clothes/.png"
    },
    {
      "name": "Sneakers",
      "price": "650",
      "image": "assets/images/clothes/.png"
    },
  ];

  final List<Map<String, String>> _favorites = [];

  void _toggleFavorite(Map<String, String> product) {
    setState(() {
      if (_favorites.contains(product)) {
        _favorites.remove(product);
      } else {
        _favorites.add(product);
      }
    });
  }

  void _startSearch() {
    showSearch(
      context: context,
      delegate: ProductSearchDelegate(
        products: _clothes,
        favoriteItems: _favorites,
        onToggleFavorite: _toggleFavorite,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clothes"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _startSearch,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _clothes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final product = _clothes[index];
          final isFav = _favorites.contains(product);
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            product["image"]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product["name"]!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${product["price"]} EGP",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : Colors.grey,
                    ),
                    onPressed: () => _toggleFavorite(product),
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
class ProductSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> products;
  final List<Map<String, String>> favoriteItems;
  final Function(Map<String, String>) onToggleFavorite;

  ProductSearchDelegate({
    required this.products,
    required this.favoriteItems,
    required this.onToggleFavorite,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products
        .where((p) => p["name"]!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final product = results[index];
        final isFav = favoriteItems.contains(product);
        return ListTile(
          leading: Image.asset(product["image"]!, width: 50),
          title: Text(product["name"]!),
          subtitle: Text("${product["price"]} EGP"),
          trailing: IconButton(
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              onToggleFavorite(product);
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
