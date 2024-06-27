import 'package:flutter/material.dart';
import 'package:permata/home.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
        ),
        body: ShoppingCart(),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class ShoppingCart extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<CartItem> cartItems = [
    CartItem(
        imageUrl: 'assets/images/kalung1.png',
        name: 'Fate Necklace',
        material: 'Titanium Material',
        price: 135000,
        quantity: 1),
    CartItem(
        imageUrl: 'assets/images/cincin1.png',
        name: 'Couple Rings',
        material: 'Metal Material',
        price: 250000,
        quantity: 1),
  ];

  void _addItemQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void _removeItemQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  void _deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...cartItems.asMap().entries.map((entry) {
              int index = entry.key;
              CartItem item = entry.value;
              return CartItemWidget(
                cartItem: item,
                addItem: () => _addItemQuantity(index),
                removeItem: () => _removeItemQuantity(index),
                deleteItem: () => _deleteItem(index),
              );
              // ignore: unnecessary_to_list_in_spreads
            }).toList(),
            const SizedBox(height: 20),
            PaymentSection(),
            const SizedBox(height: 20),
            Divider(color: Colors.grey[300], thickness: 1),
            ForgivenessSection(),
            const SizedBox(height: 20),
            AddressSection(),
            const SizedBox(height: 20),
            TotalSection(cartItems: cartItems),
            const SizedBox(height: 20),
            BuyNowButton(),
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final String imageUrl;
  final String name;
  final String material;
  final int price;
  int quantity;

  CartItem({
    required this.imageUrl,
    required this.name,
    required this.material,
    required this.price,
    this.quantity = 1,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback addItem;
  final VoidCallback removeItem;
  final VoidCallback deleteItem;

  // ignore: use_key_in_widget_constructors
  const CartItemWidget({
    required this.cartItem,
    required this.addItem,
    required this.removeItem,
    required this.deleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              cartItem.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartItem.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              Text(cartItem.material,
                  style: const TextStyle(color: Colors.grey)),
              Text('Rp. ${cartItem.price},00',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: removeItem,
        ),
        Text(cartItem.quantity.toString()),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: addItem,
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: deleteItem,
        ),
      ],
    );
  }
}

// ignore: use_key_in_widget_constructors
class PaymentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Payment:'),
        const Spacer(),
        DropdownButton<String>(
          value: 'COD',
          items: <String>['COD'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {},
        ),
      ],
    );
  }
}

// ignore: use_key_in_widget_constructors
class ForgivenessSection extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ForgivenessSectionState createState() => _ForgivenessSectionState();
}

class _ForgivenessSectionState extends State<ForgivenessSection> {
  bool isForgive = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('For:'),
        Row(
          children: [
            const Text('Give'),
            const Spacer(),
            Switch(
              value: isForgive,
              onChanged: (value) {
                setState(() {
                  isForgive = value;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text('Note:'),
        const TextField(
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: use_key_in_widget_constructors
class AddressSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Address:'),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter your city',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          ),
        ),
      ],
    );
  }
}

class TotalSection extends StatelessWidget {
  final List<CartItem> cartItems;

  // ignore: use_key_in_widget_constructors
  const TotalSection({required this.cartItems});

  int _calculateTotal() {
    int total = 0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    int total = _calculateTotal();
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total'),
            Text('Rp. $total',
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee'),
            Text('Rp. 0', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
          height: 20,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Sub Total'),
            Text('Rp. $total',
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}

// ignore: use_key_in_widget_constructors
class BuyNowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add your onPressed code here!
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Buy Now'),
          ],
        ),
      ),
    );
  }
}
