// 1) Add these model classes (e.g. at the top of your file):
import 'package:flutter/material.dart';

class OrderItem {
  final String name;
  final int quantity;
  final double price;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
  });
}

class Order {
  final String id;
  final String date; // e.g. "April 20, 2025"
  final double total;
  final String status; // e.g. "Delivered", "Processing"
  final List<OrderItem> items;

  Order({
    required this.id,
    required this.date,
    required this.total,
    required this.status,
    required this.items,
  });
}

// 2) Add the OrderHistoryScreen widget:

class OrderHistoryScreen extends StatelessWidget {
  OrderHistoryScreen({Key? key}) : super(key: key);

  // Dummy data
  final List<Order> _orders = [
    Order(
      id: '1001',
      date: 'April 20, 2025',
      total: 150.75,
      status: 'Delivered',
      items: [
        OrderItem(name: 'Perfume A', quantity: 1, price: 75.50),
        OrderItem(name: 'Smart Watch B', quantity: 1, price: 75.25),
      ],
    ),
    Order(
      id: '1002',
      date: 'April 25, 2025',
      total: 80.00,
      status: 'Processing',
      items: [
        OrderItem(name: 'Clothes C', quantity: 2, price: 40.00),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
        centerTitle: true,
      ),
      body: _orders.isEmpty
          ? const Center(child: Text('You have no past orders.'))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _orders.length,
        itemBuilder: (context, i) {
          final order = _orders[i];
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
            child: ExpansionTile(
              leading: const Icon(Icons.shopping_bag),
              title: Text('Order #${order.id}'),
              subtitle: Text('${order.date} • ${order.status}'),
              children: [
                // List each item
                ...order.items.map((item) =>
                    ListTile(
                      title: Text(item.name),
                      subtitle: Text('Qty: ${item.quantity}'),
                      trailing:
                      Text('\$${item.price.toStringAsFixed(2)}'),
                    )),
                // Divider + total row
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('\$${order.total.toStringAsFixed(2)}',
                          style:
                          const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
