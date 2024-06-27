import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: CartPage()));
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<CartItem> _cartItems = [
    CartItem(
      imageUrl: 'assets/necklace1.jpg',
      title: 'Fate Necklace',
      subtitle: 'Titanium Material',
      price: 'Rp. 135.000,00',
      quantity: 1,
      checked: false,
    ),
    CartItem(
      imageUrl: 'assets/ring2.jpg',
      title: 'Couple Rings',
      subtitle: 'Metal Material',
      price: 'Rp. 250.000,00',
      quantity: 1,
      checked: false,
    ),
    CartItem(
      imageUrl: 'assets/necklace3.jpg',
      title: 'Amore Necklace',
      subtitle: 'Titanium Material',
      price: 'Rp. 120.000,00',
      quantity: 1,
      checked: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Bag',
              style: TextStyle(fontFamily: 'InriaSerif', color: Colors.black),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: _cartItems
                .map((item) => CartItemWidget(
                      item: item,
                      onChanged: (checked) {
                        setState(() {
                          item.checked = checked!;
                        });
                      },
                      onQuantityChanged: (quantity) {
                        setState(() {
                          item.quantity = quantity;
                        });
                      },
                      onDelete: () {
                        setState(() {
                          _cartItems.remove(item);
                        });
                      },
                    ))
                .toList(),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Rp. ${_calculateTotal()}',
                  style: const TextStyle(
                      fontFamily: 'InriaSerif',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                        fontFamily: 'InriaSerif', color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.grey),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.blueGrey,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const [
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
            ),
          ),
        ],
      ),
    );
  }

  int _calculateTotal() {
    int total = 0;
    for (var item in _cartItems) {
      if (item.checked) {
        total += int.parse(item.price.replaceAll(RegExp(r'[^\d]'), '')) *
            item.quantity;
      }
    }
    return total;
  }
}

class CartItem {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;
  int quantity;
  bool checked;

  CartItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.quantity,
    this.checked = false,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final ValueChanged<bool?> onChanged;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onDelete;

  const CartItemWidget({
    Key? key,
    required this.item,
    required this.onChanged,
    required this.onQuantityChanged,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Checkbox(
                value: item.checked,
                onChanged: onChanged,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  item.imageUrl,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                          fontFamily: 'InriaSerif',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      item.subtitle,
                      style: TextStyle(
                        fontFamily: 'InriaSerif',
                      ),
                    ),
                    Text(item.price,
                        style: const TextStyle(
                            fontFamily: 'InriaSerif', color: Colors.black)),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (item.quantity > 1) {
                        onQuantityChanged(item.quantity - 1);
                      }
                    },
                  ),
                  Text(
                    '${item.quantity}',
                    style: TextStyle(
                      fontFamily: 'InriaSerif',
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      onQuantityChanged(item.quantity + 1);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: onDelete,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(height: 1, color: Colors.grey),
      ],
    );
  }
}
