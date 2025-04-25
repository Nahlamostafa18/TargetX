import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> images;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;

  const ImageCarousel({super.key,
    required this.images,
    required this.currentIndex,
    required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: images
              .map((url) =>
              CachedNetworkImage(
                  imageUrl: url, fit: BoxFit.cover, width: double.infinity))
              .toList(),
          options: CarouselOptions(
            aspectRatio: 1,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            onPageChanged: (idx, _) => onPageChanged(idx),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images
              .asMap()
              .entries
              .map((entry) {
            final idx = entry.key;
            final isActive = idx == currentIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive
                    ? Theme
                    .of(context)
                    .primaryColor
                    : Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}