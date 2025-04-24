import 'package:flutter/material.dart';

class CouponsSectionWidget extends StatelessWidget {
  const CouponsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final coupons = <String>[
      'assets/images/coupon.png',
      'assets/images/coupon.png',
      'assets/images/coupon.png',
    ];
    return SizedBox(
      height: 120, // adjust height as needed
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: coupons.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              coupons[index],
              width: 320,
              height: 120,
              fit: BoxFit.fitWidth,
            ),
          );
        },
      ),
    );
  }
}
