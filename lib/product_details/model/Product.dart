import 'Rating.dart';

class Product {
  final String title;
  final String description;
  final double price;
  final double discount;
  final bool isBestSeller;
  final double rating;
  final bool inStock;
  final List<String> images;
  final List<Rating> ratings;
  final List<Product> similarProducts;

  const Product(
      {required this.title,
      required this.description,
      required this.price,
      required this.discount,
      required this.isBestSeller,
      required this.rating,
      required this.inStock,
      required this.images,
      required this.ratings,
      required this.similarProducts});
}
