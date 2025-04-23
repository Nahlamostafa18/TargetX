import 'package:flutter/material.dart';

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
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => close(context, null));
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
            icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: isFav ? Colors.red : Colors.grey),
            onPressed: () => onToggleFavorite(product),
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
