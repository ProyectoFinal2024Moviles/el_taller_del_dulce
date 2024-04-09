import 'package:el_taller_del_dulce/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'car_page.dart';
import 'news_page.dart';
import 'profile_page.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenu();
}

class _NavigationMenu extends State<NavigationMenu> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CarPage(),
    NewsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8BBD0),
      appBar: AppBar(
        title:       Row(
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
        backgroundColor: Colors.transparent, // Hace que el fondo del AppBar sea transparente
        elevation: 0, // Quita la sombra del AppBar
        centerTitle: false,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Color(0xFFE91E63)), label: 'Inicio', backgroundColor: Colors.white),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart, color: Color(0xFFE91E63)), label: 'Carrito'),
          BottomNavigationBarItem(icon: Icon(Icons.announcement, color: Color(0xFFE91E63)), label: 'Noticias'),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: Color(0xFFE91E63)), label: 'Perfil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFE91E63),
        onTap: _onItemTapped,
      ),
    );
  }
}
