import 'package:flutter/material.dart';
import 'package:el_taller_del_dulce/pages/types/personalizadas.dart';
import 'package:el_taller_del_dulce/pages/types/postres_sin_azucar_page.dart';
import 'package:el_taller_del_dulce/pages/types/postres_sin_lactosa_page.dart';
import 'package:el_taller_del_dulce/pages/types/postres_tradicionales_page.dart';
import 'package:el_taller_del_dulce/pages/types/sin_azucar_page.dart';
import 'package:el_taller_del_dulce/pages/types/refrigeradas_page.dart';
import 'package:el_taller_del_dulce/pages/types/tradicionales_page.dart';
import 'product_details/chocolate_cake_page.dart';

class Product {
  final String name;
  final String image;
  final Widget destinationPage;

  Product({
    required this.name,
    required this.image,
    required this.destinationPage,
  });
}

final List<Product> cakes = [
  Product(
    name: 'Tradicionales',
    image: 'assets/images/chocolate.jpg',
    destinationPage: TradicionalesPage(),
  ),
  Product(
    name: 'Refrigeradas',
    image: 'assets/images/refrigerada.jpg',
    destinationPage: RefrigeradasPage(),
  ),
  Product(
    name: 'Sin azúcar',
    image: 'assets/images/sinazucar.jpeg',
    destinationPage: SinAzucarPage(),
  ),
  Product(
    name: 'Personalizadas',
    image: 'assets/images/personalizada.jpg',
    destinationPage: PersonalizadasPage(),
  ),
];

final List<Product> desserts = [
  Product(
    name: 'Postres Tradicionales',
    image: 'assets/images/postresTradicionales.jpg',
    destinationPage: PostresTradicionalesPage(),
  ),
  Product(
    name: 'Postres Sin Azúcar',
    image: 'assets/images/postresSinAzucar.jpg',
    destinationPage: PostresSinAzucarPage(),
  ),
  Product(
    name: 'Postres sin Lactosa',
    image: 'assets/images/sinLeche.jpg',
    destinationPage: PostresSinLactosaPage(),
  ),
];

final List<Product> drinks = [
  Product(
    name: 'Coca-Cola',
    image: 'assets/images/cocacola.png',
    destinationPage: DetailsPage(),
  ),
  Product(
    name: 'Jugo de naranja',
    image: 'assets/images/jugoNaranja.jpeg',
    destinationPage: DetailsPage(),
  ),
  Product(
    name: 'Hatsu',
    image: 'assets/images/hatsu.jpeg',
    destinationPage: DetailsPage(),
  ),
  Product(
    name: 'Granizados de Café',
    image: 'assets/images/granizado.jpg',
    destinationPage: DetailsPage(),
  ),
];

final List<Product> offers = [
  Product(
    name: 'Granizados de Café 2x1 los días martes',
    image: 'assets/images/granizado.jpg',
    destinationPage: DetailsPage(),
  ),
  Product(
    name: '¡HOY! Torta de Chocolate en 35.000',
    image: 'assets/images/chocolate.jpg',
    destinationPage: DetailsPage(),
  ),
];

List<Product> currentProducts = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentCategory = 'Tortas';

  @override
  void initState() {
    super.initState();
    currentProducts = cakes; //categoría de tortas por defecto
  }

  void searchProducts(String query) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TradicionalesPage()),
    );
    //print('Buscando: $query');
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
      backgroundColor: const Color(0xFFF8BBD0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Bienvenid@\nDaniela Villadiego',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
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
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.white, width: 2),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCategoryButton('Tortas'),
              buildCategoryButton('Postres'),
              buildCategoryButton('Bebidas'),
              buildCategoryButton('Ofertas'),
            ],
          ),
          const SizedBox(height: 40),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0, //
              ),
              itemCount: currentProducts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => navigateToProductPage(currentProducts[index]),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: ItemCard(
                      image: currentProducts[index].image,
                      title: currentProducts[index].name,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryButton(String category) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          currentCategory = category;
          if (category == 'Tortas') {
            currentProducts = cakes;
          } else if (category == 'Postres') {
            currentProducts = desserts;
          } else if (category == 'Bebidas') {
            currentProducts = drinks;
          } else if (category == 'Ofertas') {
            currentProducts = offers;
          }
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: currentCategory == category
            ? const Color(0xFFE91E63)
            : Colors.white,
      ),
      child: Text(
        category,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String image;
  final String title;

  const ItemCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
