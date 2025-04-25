import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../model/Product.dart';

class SimilarProducts extends StatelessWidget {
  final List<Product> products;

  const SimilarProducts({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (c, i) => const SizedBox(width: 12),
        itemBuilder: (c, i) {
          final p = products[i];
          return SizedBox(
            width: 140,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl: p.images.first,
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(p.title, maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    Text(
                        '${(p.price * (1 - p.discount / 100)).toStringAsFixed(0)} EGP',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    if (p.discount > 0)
                      Text('${p.price.toStringAsFixed(0)} EGP',
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

