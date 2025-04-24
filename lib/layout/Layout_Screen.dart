import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:targetx/favourite/favorites_screen.dart';
import 'package:targetx/home/HomeScreen.dart';
import 'package:targetx/sections/sections_screen.dart';

import '../cart/CartScreen.dart';
import '../profile/Profile_Screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    FavoritesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset("assets/images/ic_home.svg"),
      label: 'Home',
      activeIcon: SvgPicture.asset(
        "assets/images/ic_home.svg",
        colorFilter: const ColorFilter.mode(
          Color(0xFF413B99),
          BlendMode.srcIn,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset("assets/images/ic_favorite.svg"),
      label: 'Favorite',
      activeIcon: SvgPicture.asset(
        "assets/images/ic_favorite.svg",
        colorFilter: const ColorFilter.mode(
          Color(0xFF413B99),
          BlendMode.srcIn,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset("assets/images/ic_cart.svg"),
      label: 'Cart',
      activeIcon: SvgPicture.asset(
        "assets/images/ic_cart.svg",
        colorFilter: const ColorFilter.mode(
          Color(0xFF413B99),
          BlendMode.srcIn,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset("assets/images/ic_profile.svg"),
      label: 'Profile',
      activeIcon: SvgPicture.asset(
        "assets/images/ic_profile.svg",
        colorFilter: const ColorFilter.mode(
          Color(0xFF413B99),
          BlendMode.srcIn,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _items,
        onTap: _onTabTapped,
        selectedItemColor: const Color(0xFF413B99),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
