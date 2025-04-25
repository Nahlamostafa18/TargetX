import 'package:flutter/material.dart';
import 'package:targetx/product_details/ProductDetailsScreen.dart';

import '../../product_details/model/Product.dart';

class BestSellingWidget extends StatelessWidget {
  const BestSellingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'title': 'Headphone P9 Pro Max Wireless Bluetooth Headphones',
        'price': '590',
        'old': '650',
        'currency': 'EGP',
        'discount': '-50%',
        'label': 'best seller',
        'image': 'assets/images/speaker.png',
      },
      {
        'title': 'Laptop P9 Pro Max Wireless Bluetooth Headphones',
        'price': '1590',
        'old': '1650',
        'currency': 'EGP',
        'discount': '-50%',
        'label': 'best seller',
        'image': 'assets/images/laptop.png',
      },
      {
        'title': 'Headphone P9 Pro Max Wireless Bluetooth Headphones',
        'price': '590',
        'old': '650',
        'currency': 'EGP',
        'discount': '-50%',
        'label': 'best seller',
        'image': 'assets/images/speaker.png',
      },
      {
        'title': 'Laptop P9 Pro Max Wireless Bluetooth Headphones',
        'price': '1590',
        'old': '1650',
        'currency': 'EGP',
        'discount': '-50%',
        'label': 'best seller',
        'image': 'assets/images/laptop.png',
      },
      // …more products
    ];

    return SizedBox(
      height: 280, // adjust as needed to fit image + details
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, i) {
          final p = products[i];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                            product: Product(
                              similarProducts: [],
                              ratings: [],
                              title: p['title']!,
                              description: 'Description of ${p['title']}',
                              price: double.parse(p['price']!),
                              discount: double.parse(
                                      p['discount']!.replaceAll('%', '')) /
                                  100,
                              isBestSeller: true,
                              rating: 4.5,
                              inStock: true,
                              images: [
                                "https://i.imgur.com/zJ2PR8u.png",
                                "https://i.imgur.com/sFln671.png",
                                "https://i.imgur.com/zJ2PR8u.png",
                                "https://i.imgur.com/sFln671.png"
                              ],
                            ),
                          )));
            },
            child: Container(
              width: 220,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.grey.shade300, width: 1),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // badges
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        // discount
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
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
                        const SizedBox(width: 8),
                        // label
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
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

                  // image
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Image.asset(
                        p['image']!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const Divider(height: 1, color: Colors.grey),

                  // title & prices
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p['title']!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
