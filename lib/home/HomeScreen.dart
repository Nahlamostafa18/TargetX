import 'package:flutter/material.dart';
import 'package:targetx/home/widget/BestSellingWidget.dart';
import 'package:targetx/home/widget/CoupinSectionWidget.dart';
import 'package:targetx/home/widget/ExclusiveOffersWidget.dart';
import 'package:targetx/home/widget/ExploreSectionsWidget.dart';
import 'package:targetx/home/widget/FavoriteSectionWidget.dart';
import 'package:targetx/home/widget/HomeDiscountWidget.dart';
import 'package:targetx/home/widget/HomeHeaderWidget.dart';
import 'package:targetx/home/widget/HomeSearchBar.dart';
import 'package:targetx/home/widget/HomeSectionTitle.dart';
import 'package:targetx/home/widget/OffersBannerWidget.dart';
import 'package:targetx/sections/sections_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              height: 160,
              width: double.infinity,
              'assets/images/gradient_bg.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          // Content overlays background
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const HomeHeaderWidget(),
                  const SizedBox(height: 24),
                  const HomeSearchBar(),
                  const SizedBox(height: 24),
                  const HomeDiscountWidget(),
                  const SizedBox(height: 16),
                  const HomeSectionTitle(title: 'Favorite Sections'),
                  const FavoriteSectionWidget(),
                  const SizedBox(height: 16),
                  const BestSellingWidget(),
                  const SizedBox(height: 16),
                  HomeSectionTitle(
                    title: 'Explore Sections',
                    onClickViewAll: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SectionsScreen(),
                        ),
                      );
                    },
                  ),
                  const ExploreSectionsWidget(),
                  const SizedBox(height: 16),
                  const HomeSectionTitle(title: 'Explore Offers'),
                  const SizedBox(height: 16),
                  const OffersBannerWidget(),
                  const SizedBox(height: 16),
                  const HomeSectionTitle(title: 'Exclusive Offer'),
                  const ExclusiveOffersWidget(),
                  const SizedBox(height: 16),
                  const HomeSectionTitle(title: 'Coupons'),
                  const CouponsSectionWidget(),
                  const SizedBox(height: 16),
                  const HomeSectionTitle(title: 'Best Selling Products'),
                  const BestSellingWidget(),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
