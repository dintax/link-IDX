import 'package:flutter/material.dart';
import 'package:permata/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NecklaceListScreen(),
    );
  }
}

class NecklaceListScreen extends StatelessWidget {
  final List<Kalung> kalungs = [
    Kalung("Fate Necklace", "Metal Material", 250000, 'assets/necklace1.jpg'),
    Kalung("Tree Necklace", "Metal Material", 150000, 'assets/necklace2.jpg'),
    Kalung("Nats Necklace", "Metal Material", 180000, 'assets/necklace3.jpg'),
    Kalung("Amore Necklace", "Metal Material", 210000, 'assets/necklace4.jpg'),
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
          "Necklace",
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
          itemCount: kalungs.length,
          itemBuilder: (context, index) {
            final Kalung = kalungs[index];
            return KalungCard(kalung: Kalung);
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
            icon: Icon(Icons.person_outline),
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

class Kalung {
  final String name;
  final String material;
  final int price;
  final String imageUrl;

  Kalung(this.name, this.material, this.price, this.imageUrl);
}

class KalungCard extends StatelessWidget {
  final Kalung kalung;

  const KalungCard({required this.kalung});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              kalung.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          kalung.name,
          style: TextStyle(
            fontFamily: 'InriaSerif',
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          kalung.material,
          style: TextStyle(
            fontFamily: 'InriaSerif',
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          "Rp. ${kalung.price},00",
          style: TextStyle(
            fontFamily: 'InriaSerif',
            fontWeight: FontWeight.bold,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
