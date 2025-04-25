import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:targetx/checkout/widget/CartItemWidget.dart';
import 'package:targetx/order_confirmation/OrderConfirmationScreen.dart';
import 'package:targetx/shared/widget/CustomButton.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int quantity = 1;
  final int pricePerItem = 23800;
  final int shipping = 70;

  @override
  Widget build(BuildContext context) {
    int subtotal = pricePerItem * quantity;
    int total = subtotal + shipping;

    Widget priceText(int amount) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$amount ',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF5D3FD3),
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextSpan(
              text: 'EGP',
              style: TextStyle(
                fontSize: 10,
                color: Color(0xFF5D3FD3),
              ),
            ),
          ],
        ),
      );
    }

    Widget summaryPriceText(int amount, {bool isTotal = false}) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$amount ',
              style: TextStyle(
                fontSize: isTotal ? 18 : 16,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                color: isTotal ? Colors.orange : Colors.black,
              ),
            ),
            TextSpan(
              text: 'EGP',
              style: TextStyle(
                fontSize: isTotal ? 12 : 10,
                color: isTotal ? Colors.orange : Colors.black,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: SingleChildScrollView(
            child: Column(
              children: [
// Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Buy The Product",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey),
                      ),
                      child:
                          const Icon(Icons.arrow_forward_ios_rounded, size: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

// Product Info
                CartItemWidget(),
                const SizedBox(height: 24),

// Payment Method
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Payment Method",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: const [
                      FaIcon(FontAwesomeIcons.ccVisa,
                          size: 40, color: Colors.blue),
                      SizedBox(width: 16),
                      Text("Jenius Card\n0274 7414 ***",
                          style: TextStyle(fontSize: 14)),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded, size: 16),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

// Price Summary
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Subtotal", style: TextStyle(fontSize: 16)),
                        summaryPriceText(subtotal),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Shipping", style: TextStyle(fontSize: 16)),
                        summaryPriceText(shipping),
                      ],
                    ),
                    const Divider(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        summaryPriceText(total, isTotal: true),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),

// Location
                TextField(
                  decoration: InputDecoration(
                    hintText: "Location",
                    prefixIcon: const Icon(Icons.location_on_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),

// Phone number
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "+20",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Phone number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Add a coupon code",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      title: "Confirm The Order",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const OrderConfirmationScreen(),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
