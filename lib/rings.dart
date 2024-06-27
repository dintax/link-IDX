import 'package:flutter/material.dart';
import 'package:permata/home.dart';
import 'package:permata/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RingListScreen(),
    );
  }
}

class RingListScreen extends StatelessWidget {
  final List<Ring> rings = [
    Ring("Couple Rings", "Metal Material", 250000, 'assets/ring1.jpg'),
    Ring("Amara Rings", "Metal Material", 150000, 'assets/ring2.jpg'),
    Ring("2 in 1 Rings", "Metal Material", 180000, 'assets/ring3.jpg'),
    Ring("Aurora Rings", "Metal Material", 210000, 'assets/ring4.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Text(
          "Rings",
          style: TextStyle(
            fontFamily: 'InriaSerif',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: rings.length,
          itemBuilder: (context, index) {
            final ring = rings[index];
            return RingCard(ring: ring);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

class Ring {
  final String name;
  final String material;
  final int price;
  final String imageUrl;

  Ring(this.name, this.material, this.price, this.imageUrl);
}

class RingCard extends StatelessWidget {
  final Ring ring;

  const RingCard({required this.ring});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              ring.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          ring.name,
          style: TextStyle(
            fontFamily: 'InriaSerif',
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          ring.material,
          style: TextStyle(
            fontFamily: 'InriaSerif',
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          "Rp. ${ring.price},00",
          style: TextStyle(
            fontFamily: 'InriaSerif',
            fontWeight: FontWeight.bold,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartPage()), // Navigate to CartPage
              );
            },
          ),
        ),
      ],
    );
  }
}
