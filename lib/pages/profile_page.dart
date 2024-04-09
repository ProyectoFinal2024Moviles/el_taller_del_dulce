import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8BBD0),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Noticias y promociones',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150'), // Coloca la URL de la imagen del usuario aquí
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para cambiar la imagen
                    },
                    child: const Text('Cambiar Imagen'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Datos de Registro:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('Sombre: Pedro Pérez'), // Cambia esto por el nombre del usuario
              trailing: const Icon(Icons.edit), // Icono para editar el nombre
              onTap: () {
                // Lógica para editar el nombre
              },
            ),
            ListTile(
              title: const Text(
                  'Correo Electrónico: pedroperez@gmail.com'), // Cambia esto por el correo del usuario
              trailing: const Icon(Icons.edit), // Icono para editar el correo
              onTap: () {
                // Lógica para editar el correo
              },
            ),
            ListTile(
              title: const Text(
                  'Fecha de Nacimiento: 01/01/1990'), // Cambia esto por la fecha de nacimiento del usuario
              trailing: const Icon(Icons.edit), // Icono para editar la fecha de nacimiento
              onTap: () {
                // Lógica para editar la fecha de nacimiento
              },
            ),
            ListTile(
              title: const Text('Contraseña: ********'), // Cambia esto por la contraseña del usuario
              trailing: const Icon(Icons.edit), // Icono para editar la contraseña
              onTap: () {
                // Lógica para editar la contraseña
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el historial de pedidos
                  },
                  child: const Text('Historial de Pedidos'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el contacto
                  },
                  child: const Text('Contacto'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
