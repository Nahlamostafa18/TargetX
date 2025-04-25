import 'package:flutter/material.dart';

import '../model/NotificationModel.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Icon(
          notification.isRead ? Icons.notifications_off : Icons.notifications,
          color: notification.isRead ? Colors.grey : Colors.blue,
        ),
        title: Text(notification.title),
        subtitle: Text(notification.message),
        trailing: Text(
          '${notification.timestamp.hour}:${notification.timestamp.minute}',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        onTap: () {
          // Mark as read and navigate to the notification details
          // You can add more logic here to mark the notification as read
        },
      ),
    );
  }
}
