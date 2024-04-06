import 'package:flutter/material.dart';

class TypesPage extends StatelessWidget {
  const TypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/title.png',
              width: 19,
              height: 19,
            ),
            const SizedBox(width: 10),
            const Text(
              "El taller del dulce",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        // Hace que el fondo del AppBar sea transparente
        elevation: 0,
        // Quita la sombra del AppBar
        centerTitle: false,
      ),
      backgroundColor: Color(0xFFF8BBD0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row( //Const
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 16,
                    ),
                    Text('Buscar'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
