import 'package:flutter/material.dart';

class FavoriteSectionWidget extends StatelessWidget {
  const FavoriteSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ['All', 'Perfumes', 'Smart Watches', 'Clothes'];
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          return ChoiceChip(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            label: Text(tabs[i]),
            selected: i == 0,
            onSelected: (_) {},
          );
        },
      ),
    );
  }
}
