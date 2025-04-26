import 'package:flutter/material.dart';

import '../OffersScreen.dart';

class HomeDiscountWidget extends StatelessWidget {
  const HomeDiscountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OffersScreen(),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                width: 350,
                height:110,
                child: Image.asset(
                  'assets/images/discount_banner.png',
                  fit: BoxFit.cover,
                ),
              ),

            ),
          );
        },
      ),
    );
  }
}
