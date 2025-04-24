import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [
    CartItem(
      image: "assets/images/camera.png",
      title: "Sponge headband",
      price: 100.0,
      quantity: 1,
    ),
    CartItem(
      image: "assets/images/laptop.png",
      title: "Run It Jacket",
      price: 1299.0,
      oldPrice: 2299.0,
      quantity: 1,
    ),
    CartItem(
      image: "assets/images/clothes.png",
      title: "Garnier Micellar Water",
      price: 400.0,
      quantity: 1,
    ),
  ];

  double shipping = 50.0;

  double get subtotal {
    return cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  double get total {
    return subtotal + shipping;
  }

  // Function to handle Checkout logic
  void _handleCheckout() {
    if (cartItems.isEmpty) {
      // If the cart is empty, show a message
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
          title: const Text('Empty Cart'),
          content: const Text(
            'Your cart is empty. Please add items to proceed.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Proceed to checkout
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CheckoutPage(),
        ), // Replace with your checkout page
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("Cart", style: TextStyle(color: Colors.black)),
        leading: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.person, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: cartItems.map((item) => _buildCartItem(item)).toList(),
            ),
          ),
          _buildSummarySection(),
        ],
      ),
    );
  }

  Widget _buildCartItem(CartItem item) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.asset(item.image, width: 120, height: 130, fit: BoxFit.cover),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  if (item.oldPrice != null)
                    Text(
                      "${item.oldPrice} EGP",
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  Text(
                    "${item.price} EGP",
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildQtyButton(Icons.remove, item, -1),
                      const SizedBox(width: 8),
                      Text(
                        item.quantity.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      _buildQtyButton(Icons.add, item, 1),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.grey),
              onPressed: () {
                setState(() {
                  cartItems.remove(item);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQtyButton(IconData icon, CartItem item, int change) {
    return IconButton(
      icon: Icon(icon, size: 16),
      onPressed: () {
        setState(() {
          item.quantity += change;
          if (item.quantity < 1) item.quantity = 1;
        });
      },
    );
  }

  Widget _buildSummarySection() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        children: [
          _buildPriceRow(
            "Subtotal:",
            subtotal > 0 ? "${subtotal.toStringAsFixed(2)} EGP" : "0.00 EGP",
          ),
          const SizedBox(height: 4),
          _buildPriceRow(
            "Shipping:",
            shipping > 0 ? "${shipping.toStringAsFixed(2)} EGP" : "0.00 EGP",
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Price:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "( ${cartItems.length} items ) ${total.toStringAsFixed(2)} EGP",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap:
            _handleCheckout, // When tapped, call _handleCheckout function
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "Checkout",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label), Text(amount)],
      ),
    );
  }
}

// Example of a Checkout Page (replace with your checkout flow)
class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: const Center(
        child: Text('Proceed to payment or other checkout details'),
      ),
    );
  }
}

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