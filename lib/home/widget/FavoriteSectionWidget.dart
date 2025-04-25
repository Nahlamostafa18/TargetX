import 'package:flutter/material.dart';

/// Favorites section with selectable tabs
class FavoriteSectionWidget extends StatefulWidget {
  const FavoriteSectionWidget({super.key});

  @override
  _FavoriteSectionWidgetState createState() => _FavoriteSectionWidgetState();
}

class _FavoriteSectionWidgetState extends State<FavoriteSectionWidget> {
  final List<String> tabs = ['All', 'Perfumes', 'Smart Watches', 'Clothes'];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
            selected: _selectedIndex == i,
            onSelected: (selected) {
              setState(() {
                _selectedIndex = i;
              });
            },
          );
        },
      ),
    );
  }
}
