import 'package:flutter/material.dart';
import 'package:targetx/home/HomeScreen.dart';
import 'package:targetx/layout/Layout_Screen.dart';

import '../contact/ContanctServiceScreen.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({super.key});

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  int _currentStep = 2;
  bool _isOrderCancelled = false;

  // بيانات وهمية
  String address = "elmansoura";
  int quantity = 1;
  String paymentMethod = "Upon receipt";
  String date = "August 20, 2024";
  double totalPrice = 23870.0;
  bool contactRequested = false;

  void _cancelOrder() {
    setState(() {
      _isOrderCancelled = true;
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Order has been cancelled.")));
  }

  void _contactCustomerService() {
    setState(() {
      contactRequested = true;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ContactServiceScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "order's process",
                    style: TextStyle(color: Colors.black45, fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LayoutScreen(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black45,
                      size: 18,
                    ),
                  )
                ],
              ),
            ),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Order Status",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Stepper & Product
            _buildStepperAndProduct(),

            const SizedBox(height: 16),

            // Order Details
            _buildDetails(),

            const Spacer(),

            // Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: _isOrderCancelled ? null : _cancelOrder,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6C47FF),
                      minimumSize: const Size.fromHeight(70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      _isOrderCancelled ? "Order Cancelled" : "Cancel An Order",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: _contactCustomerService,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color.fromARGB(255, 113, 3, 187),
                      ),
                      minimumSize: const Size.fromHeight(70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Contact Customer Service",
                      style: TextStyle(color: Color(0xFF6C47FF), fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepperAndProduct() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            // Stepper
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _step(_currentStep >= 1),
                Expanded(
                  child: Divider(thickness: 1, color: Colors.grey.shade300),
                ),
                _step(_currentStep >= 2),
                Expanded(
                  child: Divider(thickness: 1, color: Colors.grey.shade300),
                ),
                _step(_currentStep >= 3),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Preparation", style: TextStyle(fontSize: 12)),
                Text("Delivery", style: TextStyle(fontSize: 12)),
                Text("Receiving", style: TextStyle(fontSize: 12)),
              ],
            ),
            const SizedBox(height: 16),

            // Product
            Row(
              children: [
                Image.asset("assets/images/camera.png", width: 100, height: 80),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Watch Series 10 GPS 46 mm Smartwatch",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            "23,800 EGP",
                            style: TextStyle(
                              color: Color(0xFF6C47FF),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            "24,250 EGP",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _step(bool active) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF6C47FF) : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
      child: active
          ? const Center(
              child: Icon(Icons.check, size: 14, color: Colors.white),
            )
          : null,
    );
  }

  Widget _buildDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            _detailRow("Address", address),
            _detailRow("Quantity", "$quantity piece"),
            _detailRow("Payment methods", paymentMethod),
            _detailRow("Date", date),
            _detailRow(
              "Total",
              "${totalPrice.toStringAsFixed(0)} EGP",
              highlight: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value, {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: TextStyle(
              fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
              color: highlight ? Colors.orange : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
