import 'package:flutter/material.dart';
import 'package:permata/bracelet.dart';
import 'package:permata/home.dart';

void main() {
  runApp(MyApp());
}

class OrderListScreen extends StatelessWidget {
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
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          OrderCard(
            orderId: 'ID 0001',
            itemName1: 'Fate Necklace',
            quantity1: 1,
            itemName2: 'Couple Rings',
            quantity2: 1,
            subtotal: 385000,
            orderDate: '01/01/2024',
            deliveryDate: '01/01/2024',
            name: 'Leni',
          ),
          SizedBox(height: 16.0),
          OrderCard(
            orderId: 'ID 0002',
            itemName1: 'Fate Necklace',
            quantity1: 1,
            itemName2: 'Couple Rings',
            quantity2: 1,
            subtotal: 385000,
            orderDate: '01/01/2024',
            deliveryDate: '01/01/2024',
            name: 'Leni',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list), label: 'Catalog'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List Order'),
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0, // Set the initial selected index
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderId;
  final String itemName1;
  final int quantity1;
  final String itemName2;
  final int quantity2;
  final int subtotal;
  final String orderDate;
  final String deliveryDate;
  final String name;

  const OrderCard({
    Key? key,
    required this.orderId,
    required this.itemName1,
    required this.quantity1,
    required this.itemName2,
    required this.quantity2,
    required this.subtotal,
    required this.orderDate,
    required this.deliveryDate,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID $orderId', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            OrderItem(name: itemName1, quantity: quantity1),
            OrderItem(name: itemName2, quantity: quantity2),
            SizedBox(height: 8.0),
            Text('Sub Total', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Rp. $subtotal'),
            SizedBox(height: 8.0),
            Text('Order Date', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(orderDate),
            Text('Estimated Delivery',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(deliveryDate),
            SizedBox(height: 8.0),
            Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(name),
          ],
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final String name;
  final int quantity;

  const OrderItem({
    Key? key,
    required this.name,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name),
        Text('Quantity $quantity'),
      ],
    );
  }
}
