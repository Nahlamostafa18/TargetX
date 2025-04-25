import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/Coupon.dart';

class CouponsSectionWidget extends StatelessWidget {
  const CouponsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final coupons = <Coupon>[
      const Coupon(image: 'assets/images/coupon.png', code: 'COUPON50'),
      const Coupon(image: 'assets/images/coupon.png', code: 'COUPON30'),
      const Coupon(image: 'assets/images/coupon.png', code: 'COUPON10'),
    ];
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: coupons.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final coupon = coupons[index];
          return GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: coupon.code));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Copied coupon code: ${coupon.code}')),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                coupon.image,
                width: 320,
                height: 120,
                fit: BoxFit.fitWidth,
              ),
            ),
          );
        },
      ),
    );
  }
}
