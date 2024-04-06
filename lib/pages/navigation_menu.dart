import 'package:el_taller_del_dulce/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8BBD0),
      bottomNavigationBar: Obx(
            () =>
            NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
              indicatorColor: const Color(0xFFF8BBD0),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home, color: Color(0xFFE91E63),), label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.shopping_cart, color: Color(0xFFE91E63)), label: 'Carrito',),
                NavigationDestination(
                    icon: Icon(Icons.list_alt, color: Color(0xFFE91E63)), label: 'Noticias'),
                NavigationDestination(
                    icon: Icon(Icons.person, color: Color(0xFFE91E63)), label: 'Perfil'),
              ],
            ),
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [const HomePage(),Container(color: Colors.red),Container(color: Colors.purple),Container(color: Colors.blue)];
}
