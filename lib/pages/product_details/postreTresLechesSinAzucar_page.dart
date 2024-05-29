import 'package:flutter/material.dart';
import 'package:el_taller_del_dulce/pages/car_page.dart';

class TresLechesSinAzucarPage extends StatefulWidget {
  const TresLechesSinAzucarPage({super.key});

  @override
  State<TresLechesSinAzucarPage> createState() =>
      _TresLechesSinAzucarPageState();
}

class _TresLechesSinAzucarPageState extends State<TresLechesSinAzucarPage> {
  final String cake = 'assets/images/postresSinAzucarTresLeches.jpg';
  final String description = "Delicioso y cremoso postre tres leches";

  final Map<String, double> cakePrices = {
    'Porción': 12000.0,
  };

  String _selectedSize = 'Porción';
  int _quantity = 1;

  Widget _buildRadioButton(String title, double price) {
    return Column(
      children: [
        Radio(
          value: title,
          groupValue: _selectedSize,
          activeColor: Colors.black,
          onChanged: (value) {
            setState(() {
              _selectedSize = value.toString();
            });
          },
        ),
        Text(title, style: TextStyle(fontSize: 12)),
        Text('\$${price.toStringAsFixed(2)}', style: TextStyle(fontSize: 10)),
      ],
    );
  }

  void _addToCart(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarPage(
          cartItem: CartItem(
            name: 'Postre Tres Leches ($_selectedSize)',
            image: cake,
            price: cakePrices[_selectedSize]!,
            quantity: _quantity,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8BBD0),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/title.png', width: 19, height: 19),
            const SizedBox(width: 10),
            const Text(
              "El taller del dulce",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: <Widget>[
                    Image.asset(cake, width: 250, height: 250),
                    const SizedBox(height: 16.0),
                    const Text(
                      "Postre Tres Leches",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25.0),
              const Text(
                "Descripción",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                description,
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25.0),
              const Text(
                "Tamaño",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: cakePrices.keys.map((size) {
                  return _buildRadioButton(size, cakePrices[size]!);
                }).toList(),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (_quantity > 1) {
                          _quantity--;
                        }
                      });
                    },
                  ),
                  Text('Cantidad: $_quantity',
                      style: const TextStyle(fontSize: 16)),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _quantity++;
                      });
                    },
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () => _addToCart(context),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE91E63)),
                    child: const Text(
                      'Añadir al carrito',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
