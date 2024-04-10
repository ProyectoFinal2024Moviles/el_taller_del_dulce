import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String image;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}

class CarPage extends StatefulWidget {
  const CarPage({super.key});

  @override
  _CarPage createState() => _CarPage();
}

class _CarPage extends State<CarPage> {
  final List<CartItem> _cartItems = [
    CartItem(
      name: 'Torta de chocolate',
      image: 'assets/images/chocolate.jpg',
      price: 45000,
    ),
    CartItem(
      name: 'Refrigerada',
      image: 'assets/images/refrigerada.jpg',
      price: 65000,
    ),
    CartItem(
      name: 'Coca-Cola 1.5L',
      image: 'assets/images/cocacola.png',
      price: 5000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8BBD0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          SizedBox(width: 70),
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                return _buildCartItem(_cartItems[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildCartText('Subtotal:', _calculateSubtotal()),
                SizedBox(height: 20),
                _buildCartText('Envío:', _calculateShipping()),
                SizedBox(height: 60),
                _buildCartText('Total:', _calculateTotal()),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.pink;
                        }
                        return const Color(0xFFE91E63);
                      },
                    ),
                  ),
                  child: const SizedBox(
                    width: 120,
                    child: Text(
                      "Pagar",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(CartItem item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 50),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (item.quantity > 1) {
                            item.quantity--;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.pink,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.remove, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 20), // Espacio entre los botones
                    Text(item.quantity.toString()),
                    SizedBox(width: 20), // Espacio entre los botones
                    InkWell(
                      onTap: () {
                        setState(() {
                          item.quantity++;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.pink,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.add, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 50), // Espacio entre los botones
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _cartItems.remove(item);
                            });
                          },
                          child: Icon(Icons.delete, color: Colors.pink),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartText(String title, double value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        Text(
          '\$${value.toStringAsFixed(2)}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  double _calculateSubtotal() {
    double subtotal = 0;
    _cartItems.forEach((item) {
      subtotal += item.price * item.quantity;
    });
    return subtotal;
  }

  double _calculateShipping() {
    return 7000;
  }

  double _calculateTotal() {
    return _calculateSubtotal() + _calculateShipping();
  }
}
