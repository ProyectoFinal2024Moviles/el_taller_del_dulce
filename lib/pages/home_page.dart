import 'package:el_taller_del_dulce/pages/types_page.dart';
import 'package:flutter/material.dart';

class Product {
  final String name;
  final String image;

  Product({
    required this.name,
    required this.image,
  });
}

final List<Product> cakes = [
  Product(
    name: 'Tradicionales',
    image: 'assets/images/chocolate.jpg',
  ),
  Product(
    name: 'Refrigeradas',
    image: 'assets/images/refrigerada.jpg',
  ),
  Product(
    name: 'Sin azúcar',
    image: 'assets/images/sinazucar.jpeg',
  ),
  Product(
    name: 'Personalizadas',
    image: 'assets/images/personalizada.jpg',
  ),
];
final List<Product> desserts = [
  Product(
    name: 'Postres Tradicionales',
    image: 'assets/images/postresTradicionales.jpg',
  ),
  Product(
    name: 'postres Sin Azúcar',
    image: 'assets/images/postresSinAzucar.jpg',
  ),
  Product(
    name: 'Postres sin Lactosa',
    image: 'assets/images/sinLeche.jpg',
  ),
];

final List<Product> drinks = [
  Product(
    name: 'Coca-Cola',
    image: 'assets/images/cocacola.png',
  ),
  Product(
    name: 'Jugo de naranja',
    image: 'assets/images/jugoNaranja.jpeg',
  ),
  Product(
    name: 'Hatsu',
    image: 'assets/images/hatsu.jpeg',
  ),
  Product(
    name: 'Granizados de Café',
    image: 'assets/images/granizado.jpg',
  ),
];

final List<Product> offers = [
  Product(
    name: 'Granizados de Café 2x1 los días martes',
    image: 'assets/images/granizado.jpg',
  ),
  Product(
    name: '¡HOY! Torta de Chocolate en 35.000',
    image: 'assets/images/chocolate.jpg',
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
    currentProducts = desserts;
  }

  void searchProducts(String query) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const TypesPage())
    );
    //print('Buscando: $query');
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    searchProducts('Texto del campo de búsqueda');
                  },
                  icon: Icon(Icons.search),
                  color: Colors.black,
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
                childAspectRatio:
                    1.0, // Ajusta el aspect ratio para cambiar el tamaño de los recuadros
              ),
              itemCount: currentProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: ItemCard(
                    image: currentProducts[index].image,
                    title: currentProducts[index].name,
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
        backgroundColor:
            currentCategory == category ? const Color(0xFFE91E63) : Colors.white,
      ),
      child: Text(
        category,
        style: const TextStyle(
            color: Colors.black),
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
