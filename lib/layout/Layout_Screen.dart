import 'package:flutter/material.dart';
import 'package:targetx/favourite/favorites_screen.dart';
import 'package:targetx/sections/home_screen.dart';
import 'package:targetx/sections/sections_screen.dart';

import '../profile/Profile_Screen.dart';


class LayoutScreen extends StatefulWidget {
  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeSectionScreen(),
    FavoritesScreen(favoriteItems: [
      {"name": "Smartphone", "price": "8500", "image": "assets/images/phone.png","rating":"4.5"},
      {"name": "Laptop", "price": "15000", "image": "assets/images/laptop.png","rating":"4.5"},
      {"name": "Headphones", "price": "1200", "image": "assets/images/headphones.png","rating":"4.5"},
      {"name": "Smart Watch", "price": "3000", "image": "assets/images/watch.png","rating":"4.5"},
    ]),
    SectionsScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _items,
        onTap: _onTabTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
