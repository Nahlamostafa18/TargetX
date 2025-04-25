import 'package:flutter/material.dart';
import 'package:targetx/notification/widget/NotificationTile.dart';

import 'model/NotificationModel.dart';

class NotificationsScreen extends StatelessWidget {
  final List<NotificationModel> notifications;

  const NotificationsScreen({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: dummyNotifications.isEmpty
          ? Center(child: Text('No notifications yet!'))
          : ListView.builder(
        itemCount: dummyNotifications.length,
        itemBuilder: (context, index) {
          final notification = dummyNotifications[index];
          return NotificationTile(notification: notification);
        },
      ),
    );
  }
}



// Dummy notification list
List<NotificationModel> dummyNotifications = [
  NotificationModel(
    title: 'Order Shipped',
    message: 'Your order #12345 has been shipped.',
    timestamp: DateTime.now().subtract(Duration(hours: 2)),
    isRead: false,
  ),
  NotificationModel(
    title: 'Sale Alert!',
    message: 'Hurry! 20% off on all products this weekend.',
    timestamp: DateTime.now().subtract(Duration(hours: 5)),
    isRead: true,
  ),
  NotificationModel(
    title: 'Payment Successful',
    message: 'Your payment for order #12345 was successful.',
    timestamp: DateTime.now().subtract(Duration(hours: 1, minutes: 30)),
    isRead: false,
  ),
  NotificationModel(
    title: 'Discount Available',
    message: 'Get a 10% discount on your next purchase.',
    timestamp: DateTime.now().subtract(Duration(days: 1)),
    isRead: true,
  ),
];

void main() {
  runApp(MaterialApp(
    home: NotificationsScreen(notifications: dummyNotifications),
  ));
}
