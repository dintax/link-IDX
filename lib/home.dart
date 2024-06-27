import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:permata/bracelet.dart';
import 'package:permata/earring.dart';
import 'package:permata/necklace.dart';
import 'package:permata/rings.dart';

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi, Dear',
                    style: TextStyle(
                        fontFamily: 'InriaSerif',
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CarouselSlider(
                options: CarouselOptions(
                  height: 100,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: [
                  'assets/banner1.png',
                  'assets/banner2.png',
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                        child: i.startsWith('assets')
                            ? Image.asset(
                                i,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                i,
                                fit: BoxFit.cover,
                              ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  List<Map<String, String>> products = [
                    {
                      'title': 'Rings',
                      'description': 'Deskripsi',
                      'image': 'assets/ring.jpg'
                    },
                    {
                      'title': 'Necklace',
                      'description': 'Deskripsi',
                      'image': 'assets/tree.jpg'
                    },
                    {
                      'title': 'Earrings',
                      'description': 'Deskripsi',
                      'image': 'assets/marline.jpg'
                    },
                    {
                      'title': 'Bracelet',
                      'description': 'Deskripsi',
                      'image': 'assets/bracelet.jpg'
                    },
                  ];
                  return GestureDetector(
                    onTap: () {
                      switch (products[index]['title']) {
                        case 'Rings':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RingListScreen(),
                              ));
                          break;
                        case 'Necklace':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NecklaceListScreen(),
                            ),
                          );
                          break;
                        case 'Earrings':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EarringListScreen(),
                            ),
                          );
                          break;
                        case 'Bracelet':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BraceletListScreen(),
                            ),
                          );
                          break;
                        default:
                          print(
                              'Unrecognized product title: ${products[index]['title']}');
                      }
                    },
                    child: productItem(
                      context,
                      products[index]['title']!,
                      products[index]['description']!,
                      products[index]['image']!,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: ' ',
          ),
        ],
      ),
    );
  }

  Widget productItem(
      BuildContext context, String title, String description, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(description),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
