import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:targetx/favourite/widget/FavoriteItemCard.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Map<String, dynamic>> favouriteItems = [
    {
      'title': 'Apple iPhone 16 Pro Max',
      'price': '45,000. EGP',
      'oldPrice': '',
      'img': 'assets/images/camera.png',
      'rate': '4.5/5',
      'isFavourite': true,
    },
    {
      'title': 'NARS Foundation',
      'price': '1,800. EGP',
      'oldPrice': '2,300. EGP',
      'img': 'assets/images/clothes.png',
      'rate': '4.0/5',
      'isFavourite': true,
    },
    {
      'title': 'Floral Cotton Duvet Cover Set',
      'price': '1,299. EGP',
      'oldPrice': '',
      'img': 'assets/images/laptop.png',
      'rate': '4.7/5',
      'isFavourite': true,
    },
  ];

  List<Map<String, dynamic>> additionalItems = [
    {
      'title': 'Derma Beauty Cream',
      'price': '250. EGP',
      'oldPrice': '',
      'img': 'assets/images/camera.png',
      'rate': '4.4/5',
    },
    {
      'title': 'Fashion Headwear',
      'price': '180. EGP',
      'oldPrice': '',
      'img': 'assets/images/camera.png',
      'rate': '4.6/5',
    },
  ];

  void toggleFavourite(int index) {
    setState(() {
      favouriteItems[index]['isFavourite'] =
          !(favouriteItems[index]['isFavourite'] as bool);
    });
  }

  void removeItem(int index) {
    setState(() {
      favouriteItems.removeAt(index);
    });
  }

  void addToFavourites(Map<String, dynamic> item) {
    setState(() {
      favouriteItems.add({...item, 'isFavourite': true});
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${item['title']} added to favourites")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Favourites', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: const Icon(Icons.search, color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.arrow_forward_ios, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favouriteItems.length,
              itemBuilder: (context, index) {
                final item = favouriteItems[index];
                return _buildFavItem(item, index);
              },
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "Add more to the list",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: additionalItems
                  .map(
                    (item) => Expanded(
                      child: GestureDetector(
                        onTap: () => addToFavourites(item),
                        child: buildMiniCard(item['img']),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildFavItem(Map<String, dynamic> item, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          Image.asset(item['img'], height: 60, width: 60, fit: BoxFit.cover),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    if ((item['oldPrice'] as String).isNotEmpty)
                      Text(
                        item['oldPrice'],
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    const SizedBox(width: 5),
                    Text(
                      item['price'],
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      item['rate'],
                      style: const TextStyle(color: Colors.purple),
                    ),
                    const Icon(Icons.star, size: 14, color: Colors.purple),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () => toggleFavourite(index),
                icon: Icon(
                  item['isFavourite'] ? Icons.favorite : Icons.favorite_border,
                  color: item['isFavourite'] ? Colors.red : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () => removeItem(index),
                icon: const Icon(Icons.delete_outline, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildMiniCard(String imgPath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 1,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  imgPath,
                  height: 175,
                  width: 175,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.favorite_border,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            "FILA Men’s shorts",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Text(
            "Rs. 1,299",
            style: TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }

}
