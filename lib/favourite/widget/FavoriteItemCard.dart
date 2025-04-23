import 'package:flutter/material.dart';

class FavoriteItemCard extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final String rating;
  final VoidCallback onDelete;

  const FavoriteItemCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset(
              image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "$price . EGP",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "$rating/5",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6C5DD3),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.star,
                          size: 16, color: Color(0xFF6C5DD3)),
                    ],
                  ),
                ],
              ),
            ),
          ),

          IconButton(
            icon: Image.asset("assets/images/ic_delete.png"),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
