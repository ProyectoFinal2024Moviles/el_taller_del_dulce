import 'package:flutter/material.dart';
import '../product_details/arrozConLecheSinAzucar_page.dart';
import '../product_details/cheesecakeSinAzucar_page.dart';
import '../product_details/chocolate_cake_page.dart';
import '../product_details/flanSinAzucar_page.dart';
import '../product_details/postreTresLechesSinAzucar_page.dart';

class Product {
  final String nombre;
  final String imagen;
  final Widget destinationPage;

  Product({
    required this.nombre,
    required this.imagen,
    required this.destinationPage,
  });
}

final List<Product> _productos = [
  Product(
    nombre: "CheeseCake de Piña",
    imagen: "assets/images/postresSinAzucar.jpg",
    destinationPage: CheesecakeSinAzucarPage(), // chocolateCakePage()
  ),
  Product(
    nombre: "Postres Tres Leches",
    imagen: "assets/images/postresSinAzucarTresLeches.jpg",
    destinationPage: TresLechesSinAzucarPage(),
  ),
  Product(
    nombre: "Flan de Calabaza",
    imagen: "assets/images/postresSinAzucarFlan.jpg",
    destinationPage: FlanSinAzucarPage(),
  ),
  Product(
    nombre: "Arroz Con Leche",
    imagen: "assets/images/postresSinAzucarArrozConLeche.jpg",
    destinationPage: ArrozconlecheSinAzucarPage(),
  ),
];

class PostresSinAzucarPage extends StatefulWidget {
  const PostresSinAzucarPage({super.key});

  @override
  State<PostresSinAzucarPage> createState() => _PostresSinAzucarPageState();
}

class _PostresSinAzucarPageState extends State<PostresSinAzucarPage> {
  void searchProducts(String query) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DetailsPage()));
  }

  void navigateToProductPage(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => product.destinationPage,
      ),
    );
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
        elevation: 0,
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
              const SizedBox(height: 40),
              const Text(
                "Postres Sin Azúcar",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE91E63), // Color rosado
                ),
                textAlign: TextAlign.left, // Alineado a la izquierda
              ),
              const SizedBox(height: 15),
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
                  return GestureDetector(
                    onTap: () => navigateToProductPage(_productos[index]),
                    child: Card(
                      elevation: 5,
                      child: Column(
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 1.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                              child: Image.asset(
                                _productos[index].imagen,
                                fit: BoxFit.cover,
                              ),
                            ),
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
