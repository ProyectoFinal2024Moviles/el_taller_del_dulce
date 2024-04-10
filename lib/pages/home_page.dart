import 'package:flutter/material.dart';

class Product {
  final String name;
  final String image;

  Product({
    required this.name,
    required this.image,
  });
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentCategory = 'Tortas';

  List<Product> cakes = [
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
  List<Product> desserts = [
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

  List<Product> drinks = [
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

  List<Product> offers = [
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

  @override
  void initState() {
    super.initState();
    currentProducts = desserts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8BBD0),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
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
          SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10), //
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(
                width: 50,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  //Const
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
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCategoryButton('Tortas'),
              buildCategoryButton('Postres'),
              buildCategoryButton('Bebidas'),
              buildCategoryButton('Ofertas'),
            ],
          ),
          SizedBox(height: 40),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio:
                    1.0, // Ajusta el aspect ratio para cambiar el tamaño de los recuadros
              ),
              itemCount: currentProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8),
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        unselectedItemColor: Color(0xFFF8BBD0),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Noticias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
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
      child: Text(category),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            currentCategory == category ? Colors.pink : Colors.white,
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
      padding: EdgeInsets.all(8),
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
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
