import 'package:flutter/material.dart';
import 'package:permata/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EarringListScreen(),
    );
  }
}

class EarringListScreen extends StatelessWidget {
  final List<Anting> antings = [
    Anting("Marline Earring", "Metal Material", 250000, 'assets/earring1.jpg'),
    Anting("Kumon Earring", "Metal Material", 150000, 'assets/earring2.jpg'),
    Anting("Chan Earring", "Metal Material", 180000, 'assets/earring3.jpg'),
    Anting("Diego Earring", "Metal Material", 210000, 'assets/marline.jpg'),
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
          "Earring",
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
          itemCount: antings.length,
          itemBuilder: (context, index) {
            final anting = antings[index];
            return AntingCard(anting: anting);
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

class Anting {
  final String name;
  final String material;
  final int price;
  final String imageUrl;

  Anting(this.name, this.material, this.price, this.imageUrl);
}

class AntingCard extends StatelessWidget {
  final Anting anting;

  const AntingCard({required this.anting});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              anting.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          anting.name,
          style: TextStyle(
            fontFamily: 'InriaSerif',
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          anting.material,
          style: TextStyle(
            fontFamily: 'InriaSerif',
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          "Rp. ${anting.price},00",
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
