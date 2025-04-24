import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello Ahmed',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text('Elmansoura', style: TextStyle(color: Colors.blue)),
                Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.blue),
              ],
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
                onPressed: () {},
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
