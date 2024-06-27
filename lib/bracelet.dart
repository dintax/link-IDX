import 'package:flutter/material.dart';
import 'package:permata/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BraceletListScreen(),
    );
  }
}

class BraceletListScreen extends StatelessWidget {
  final List<Gelang> gelangs = [
    Gelang("Blue Bracelet", "Metal Material", 250000, 'assets/bracelet1.jpg'),
    Gelang("Qyu Bracelet", "Metal Material", 150000, 'assets/bracelet2.jpg'),
    Gelang("Adila Bracelet", "Metal Material", 180000, 'assets/bracelet3.jpg'),
    Gelang("Bride Bracelet", "Metal Material", 210000, 'assets/bracelet4.jpg'),
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
          itemCount: gelangs.length,
          itemBuilder: (context, index) {
            final gelang = gelangs[index];
            return GelangCard(gelang: gelang);
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

class Gelang {
  final String name;
  final String material;
  final int price;
  final String imageUrl;

  Gelang(this.name, this.material, this.price, this.imageUrl);
}

class GelangCard extends StatelessWidget {
  final Gelang gelang;

  const GelangCard({required this.gelang});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              gelang.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          gelang.name,
          style: TextStyle(
            fontFamily: 'InriaSerif',
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          gelang.material,
          style: TextStyle(
            fontFamily: 'InriaSerif',
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          "Rp. ${gelang.price},00",
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
