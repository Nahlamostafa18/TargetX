import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.05,
            vertical: h * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello Ahmed",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.grey),
                      Text("Change city", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Banner
              Container(
                width: w,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.blue],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.headphones, color: Colors.white, size: 40),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Discount 30% on Headphones",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Favorite Sections
              Text(
                "Favorite Sections",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8,
                children: [
                  categoryChip("All"),
                  categoryChip("Perfumes"),
                  categoryChip("Smart Watches"),
                  categoryChip("Shoes"),
                ],
              ),

              SizedBox(height: 20),

              // Explore Section
              Text(
                "Explore Sections",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  exploreButton("Men"),
                  exploreButton("Women"),
                  exploreButton("Bags"),
                  exploreButton("Shoes"),
                  exploreButton("Kids"),
                  exploreButton("Accessories"),
                ],
              ),

              SizedBox(height: 20),

              // Offers
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Text("UP TO"),
                          Text(
                            "1,000 EGP",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "OFFERS VACATION",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.weekend,
                            size: 40,
                            color: Colors.deepPurple,
                          ),
                          SizedBox(height: 8),
                          Text("Discount up to 60%"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Coupons
              Text(
                "Coupons",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(Icons.card_giftcard, color: Colors.deepPurple),
                    SizedBox(width: 10),
                    Text("EGP 300 Coupon Available"),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Best Sellers
              Text(
                "Best Selling Products",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: [
                    productCard(
                      "iPhone 13 Pro Max",
                      "100,835",
                      Icons.phone_android,
                    ),
                    productCard("Color Serum", "300", Icons.spa),
                    productCard("Smartwatch", "22,000", Icons.watch),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryChip(String label) {
    return Chip(label: Text(label), backgroundColor: Colors.grey.shade200);
  }

  Widget exploreButton(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label),
    );
  }

  Widget productCard(String title, String price, IconData icon) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 60, color: Colors.deepPurple),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text("EGP $price", style: TextStyle(color: Colors.deepPurple)),
        ],
      ),
    );
  }
}