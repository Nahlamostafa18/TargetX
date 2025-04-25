import 'package:flutter/material.dart';
import 'package:targetx/notification/NotificationScreen.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({super.key});

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  String _selectedCity = 'Elmansoura';

  static const List<String> _cities = [
    'Cairo',
    'Giza',
    'Alexandria',
    'Luxor',
    'Aswan',
    'Hurghada',
    'Sharm El Sheikh',
  ];

  void _showCitySheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (_) => ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        itemCount: _cities.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          final city = _cities[index];
          return ListTile(
            title: Text(city),
            onTap: () {
              setState(() => _selectedCity = city);
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hello Ahmed',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: _showCitySheet,
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined,
                      size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(_selectedCity, style: TextStyle(color: Colors.blue)),
                  const Icon(Icons.keyboard_arrow_down,
                      size: 16, color: Colors.blue),
                ],
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.25),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFdedee4), width: 1),
              ),
              child: IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const NotificationsScreen(notifications: []),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xFF6C63FF),
                  shape: BoxShape.circle,
                ),
                child: const Text('2',
                    style: TextStyle(color: Colors.white, fontSize: 10)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
