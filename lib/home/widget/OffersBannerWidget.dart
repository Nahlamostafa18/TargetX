import 'package:flutter/material.dart';

class OffersBannerWidget extends StatelessWidget {
  const OffersBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/offer_banner.png",
                width: 300,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
