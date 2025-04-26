import 'package:flutter/material.dart';
import 'package:targetx/home/OffersScreen.dart';

class ExclusiveOffersWidget extends StatelessWidget {
  const ExclusiveOffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace with your actual offer images
    final offers = <String>[
      'assets/images/exclusive_offer.png',
      'assets/images/exclusive_offer.png',
      'assets/images/exclusive_offer.png',
    ];

    return SizedBox(
      height: 200,  // fixed height for the row
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: offers.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: (){
              // Handle tap event, e.g., navigate to a detailed view
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OffersScreen(),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                offers[i],
                width: 300,   // adjust per your design
                height: 200,  // match the parent height
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
