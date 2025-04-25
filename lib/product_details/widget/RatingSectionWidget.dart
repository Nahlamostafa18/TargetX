import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/Rating.dart';

class RatingSectionWidget extends StatelessWidget {
  final List<Rating> ratings;

  const RatingSectionWidget({super.key, required this.ratings});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          const Text('Ratings'),
          const SizedBox(width: 8),
          Chip(label: Text(_averageRating().toStringAsFixed(1)))
        ]),
        const SizedBox(height: 8),
        ...ratings.map((r) => ListTile(
          leading: const Icon(Icons.star, color: Colors.amber),
          title: Text(r.comment),
          subtitle:
          Text('${DateFormat.yMMMd().format(r.date)} • ${r.userName}'),
          trailing: Text(r.value.toString()),
        )),
        if (ratings.length > 2)
          TextButton(onPressed: () {}, child: const Text('Show More'))
      ],
    );
  }

  double _averageRating() {
    if (ratings.isEmpty) return 0;
    return ratings.map((r) => r.value).reduce((a, b) => a + b) / ratings.length;
  }
}