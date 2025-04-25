import 'package:flutter/material.dart';
import 'package:targetx/order_status/OrderStatusScreen.dart';
import 'package:targetx/shared/widget/CustomButton.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF3FEFB2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, size: 48, color: Colors.white),
                ),
                const SizedBox(height: 32),

                // Success Text
                const Text(
                  'success',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),

                // Description
                const Text(
                  'The order is prepared and shipped to you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 48),

                // Order Status Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: CustomButton(
                    title: "Order Status",
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (_) => const OrderStatusScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
