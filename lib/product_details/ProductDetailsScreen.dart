import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:targetx/cart/CartScreen.dart';
import 'package:targetx/home/widget/BestSellingWidget.dart';
import 'package:targetx/product_details/widget/ImageCarousel.dart';
import 'package:targetx/product_details/widget/QuantitySelectorWidget.dart';
import 'package:targetx/product_details/widget/RatingSectionWidget.dart';

import 'model/Product.dart';
import 'model/Rating.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _quantity = 1;
  int _currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageCarousel(
                images: widget.product.images,
                currentIndex: _currentImage,
                onPageChanged: (idx) => setState(() => _currentImage = idx),
              ),
              const SizedBox(height: 16),
              _buildBadgeRow(widget.product),
              const SizedBox(height: 8),
              Text(widget.product.title,
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(
                _discountedPriceText(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.deepPurple),
              ),
              const SizedBox(height: 16),
              QuantitySelector(
                quantity: _quantity,
                onChanged: (val) => setState(() => _quantity = val),
                inStock: widget.product.inStock,
              ),
              const SizedBox(height: 24),
              Text('Product Description',
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              Text(widget.product.description),
              const SizedBox(height: 24),
              RatingSectionWidget(ratings: widget.product.ratings),
              const SizedBox(height: 24),
              Text('Similar Products',
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              BestSellingWidget(),
              // SimilarProducts(products: widget.product.similarProducts),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6C63FF), Color(0xFF413B99)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return const CartScreen();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Add To Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF4C45B3), width: 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Buy Later',
                    style: TextStyle(
                      color: Color(0xFF4C45B3),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _discountedPriceText() {
    final price = widget.product.discount > 0
        ? widget.product.price * (1 - widget.product.discount / 100)
        : widget.product.price;
    return '${price.toStringAsFixed(2)} EGP';
  }
}

Widget _buildBadgeRow(Product product) {
  return Row(
    children: [
      if (product.discount > 0) ...[
        Chip(
            label: Text('-${product.discount}%'),
            backgroundColor: Colors.redAccent.shade100),
        const SizedBox(width: 8),
      ],
      if (product.isBestSeller) ...[
        Chip(
            label: const Text('Best seller'),
            backgroundColor: Colors.orange.shade100),
        const SizedBox(width: 8),
      ],
      Chip(
          label: Row(children: [
        const Icon(Icons.star, size: 16),
        const SizedBox(width: 4),
        Text(product.rating.toString())
      ])),
    ],
  );
}
