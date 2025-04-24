import 'package:flutter/material.dart';

class HomeSectionTitle extends StatelessWidget {
  final String title;

  final VoidCallback? onClickViewAll;

  const HomeSectionTitle({super.key, required this.title, this.onClickViewAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(onPressed: onClickViewAll, child: const Text('View all')),
      ],
    );
  }
}
