import 'package:flutter/material.dart';
import 'package:targetx/sections/electronics_screen.dart';

class ExploreSectionsWidget extends StatelessWidget {
  const ExploreSectionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'title': 'Clothes', 'image': 'assets/images/clothes.png'},
      {'title': 'Clothes', 'image': 'assets/images/clothes.png'},
      {'title': 'Clothes', 'image': 'assets/images/clothes.png'},
      {'title': 'Clothes', 'image': 'assets/images/clothes.png'},
    ];
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              // Handle tap event
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ElectronicsScreen(),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  Image.asset(items[i]['image']!,
                      width: 300, height: 80, fit: BoxFit.cover),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
