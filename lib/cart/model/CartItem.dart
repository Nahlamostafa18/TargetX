
// CartItem model for holding product data
class CartItem {
  final String image;
  final String title;
  final double price;
  final double? oldPrice;
  int quantity;

  CartItem({
    required this.image,
    required this.title,
    required this.price,
    this.oldPrice,
    this.quantity = 1,
  });
}
