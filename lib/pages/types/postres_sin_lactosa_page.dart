import 'package:el_taller_del_dulce/pages/navigation_menu.dart';
import 'package:flutter/material.dart';
import '../product_details/chocolate_cake_page.dart';

class Product {
  final String nombre;
  final String imagen;

  Product({required this.nombre, required this.imagen});
}

final List<Product> _productos = [
  Product(
    nombre: "Flan De Maracuyá",
    imagen: "assets/images/sinLeche.jpg",
  ),
  Product(
    nombre: "Milo",
    imagen: "assets/images/milo_cake.jpg",
  ),
];

class PostresSinLactosaPage extends StatefulWidget {
  const PostresSinLactosaPage({super.key});

  @override
  State<PostresSinLactosaPage> createState() => _PostresSinLactosaPageState();
}

class _PostresSinLactosaPageState extends State<PostresSinLactosaPage> {
  void _addButtonClicked() {
    setState(() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DetailsPage()));
    });
  }

  void searchProducts(String query) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DetailsPage()));
  }

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
      backgroundColor: const Color(0xFFF8BBD0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Buscar productos...',
                          hintStyle: TextStyle(color: Colors.black),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              searchProducts('Texto del campo de búsqueda');
                            },
                            icon: const Icon(Icons.search),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: _productos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 5,
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          _productos[index].imagen,
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _productos[index].nombre,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
