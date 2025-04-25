import 'package:flutter/material.dart';

import '../product_details/model/Product.dart';

/// SearchScreen allows users to search through a list of products
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  late List<Product> _allProducts;
  late List<Product> _filteredProducts;

  @override
  void initState() {
    super.initState();
    // Initialize dummy data using the provided Product model
    _allProducts = const [
      Product(
        title: 'Wireless Headphones',
        description: 'High-quality sound, noise cancellation',
        price: 59.99,
        discount: 10.0,
        isBestSeller: true,
        rating: 4.5,
        inStock: true,
        images: [
          "https://i.imgur.com/sFln671.png",
          "https://i.imgur.com/zJ2PR8u.png",
          "https://i.imgur.com/sFln671.png"
        ],
        ratings: [],
        similarProducts: [],
      ),
      Product(
        title: 'Smart Watch',
        description: 'Track fitness, receive notifications',
        price: 199.99,
        discount: 0.0,
        isBestSeller: false,
        rating: 4.0,
        inStock: true,
        images: [
          "https://i.imgur.com/zJ2PR8u.png",
          "https://i.imgur.com/sFln671.png",
          "https://i.imgur.com/zJ2PR8u.png",
          "https://i.imgur.com/sFln671.png"
        ],
        ratings: [],
        similarProducts: [],
      ),
      Product(
        title: ' Headphones',
        description: 'High-quality sound, noise cancellation',
        price: 59.99,
        discount: 10.0,
        isBestSeller: true,
        rating: 4.5,
        inStock: true,
        images: [
          "https://i.imgur.com/sFln671.png",
          "https://i.imgur.com/zJ2PR8u.png",
          "https://i.imgur.com/sFln671.png"
        ],
        ratings: [],
        similarProducts: [],
      ),
      Product(
        title: ' Watch',
        description: 'Track fitness, receive notifications',
        price: 199.99,
        discount: 0.0,
        isBestSeller: false,
        rating: 4.0,
        inStock: true,
        images: [
          "https://i.imgur.com/zJ2PR8u.png",
          "https://i.imgur.com/sFln671.png",
          "https://i.imgur.com/zJ2PR8u.png",
          "https://i.imgur.com/sFln671.png"
        ],
        ratings: [],
        similarProducts: [],
      ),
      // Add more dummy products as needed
    ];
    _filteredProducts = List.from(_allProducts);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredProducts = _allProducts
          .where((p) => p.title.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Products'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).cardColor,
              ),
            ),
          ),
        ),
      ),
      body: _filteredProducts.isEmpty
          ? const Center(child: Text('No products found.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(product: _filteredProducts[index]);
              },
            ),
    );
  }
}

/// A reusable card widget to display product details
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: Stack(
          children: [
            Image.network(product.images.first,
                width: 56, height: 56, fit: BoxFit.cover),
            if (!product.inStock)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: const Text(
                    'Out of Stock',
                    style: TextStyle(color: Colors.white, fontSize: 8.0),
                  ),
                ),
              ),
          ],
        ),
        title: Text(product.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            if (product.discount > 0)
              Text('Discount: ${product.discount.toStringAsFixed(0)}%'),
            Row(
              children: [
                const Icon(Icons.star, size: 16, color: Colors.amber),
                const SizedBox(width: 4.0),
                Text(product.rating.toString()),
                if (product.isBestSeller)
                  Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 2.0),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: const Text(
                      'Best Seller',
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ),
              ],
            ),
          ],
        ),
        onTap: () {
          // TODO: Navigate to product detail page
        },
      ),
    );
  }
}
