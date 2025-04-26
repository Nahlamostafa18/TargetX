import 'package:flutter/material.dart';
import 'package:targetx/product_details/ProductDetailsScreen.dart';
import '../../product_details/model/Product.dart';

/// 1) Add this screen to your routes or push it directly:
/// Navigator.of(context).push(
///   MaterialPageRoute(builder: (_) => const OffersScreen()),
/// );

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy offer products
    final offers = [
      {
        'title': 'Wireless Earbuds X10',
        'price': '299',
        'old': '499',
        'currency': 'EGP',
        'discount': '-40%',
        'label': 'limited time',
        'image': 'assets/images/camera.png',
      },
      {
        'title': '4K UHD Smart TV 55"',
        'price': '8999',
        'old': '11999',
        'currency': 'EGP',
        'discount': '-25%',
        'label': 'hot deal',
        'image': 'assets/images/laptop.png',
      },
      {
        'title': 'Gaming Laptop Pro 16GB RAM',
        'price': '14999',
        'old': '17999',
        'currency': 'EGP',
        'discount': '-15%',
        'label': 'special offer',
        'image': 'assets/images/camera.png',
      },
      // …add more offers here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Offers'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: offers.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, i) {
          final p = offers[i];
          return GestureDetector(
            onTap: () {
              // Navigate to details, constructing a full Product model
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsScreen(
                    product: Product(
                      similarProducts: [],
                      ratings: [],
                      title: p['title']!,
                      description: 'Details for "${p['title']}"',
                      price: double.parse(p['price']!),
                      discount: double.parse(
                          p['discount']!.replaceAll('%', '')) /
                          100,
                      isBestSeller: false,
                      rating: 4.0,
                      inStock: true,
                      images: [
                        "https://i.imgur.com/zJ2PR8u.png",
                        "https://i.imgur.com/sFln671.png",
                      ],
                    ),
                  ),
                ),
              );
            },
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.grey.shade300, width: 1),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  // Image
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        p['image']!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Details
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            p['title']!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),

                          // Price row
                          Row(
                            children: [
                              Text(
                                p['price']!,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ' ${p['currency']}',
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                              const Spacer(),
                              Text(
                                p['old']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                p['currency']!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Badges
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Discount badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              Color(0xFF6A11CB),
                              Color(0xFF2575FC),
                            ]),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            p['discount']!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Label badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            p['label']!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
