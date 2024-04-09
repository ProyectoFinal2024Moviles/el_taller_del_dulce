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
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150'), // Coloca la URL de la imagen del usuario aquí
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para cambiar la imagen
                    },
                    child: Text('Cambiar Imagen'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Datos de Registro:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Nombre: Pedro Pérez'), // Cambia esto por el nombre del usuario
              trailing: Icon(Icons.edit), // Icono para editar el nombre
              onTap: () {
                // Lógica para editar el nombre
              },
            ),
            ListTile(
              title: Text(
                  'Correo Electrónico: pedroperez@example.com'), // Cambia esto por el correo del usuario
              trailing: Icon(Icons.edit), // Icono para editar el correo
              onTap: () {
                // Lógica para editar el correo
              },
            ),
            ListTile(
              title: Text(
                  'Fecha de Nacimiento: 01/01/1990'), // Cambia esto por la fecha de nacimiento del usuario
              trailing: Icon(Icons.edit), // Icono para editar la fecha de nacimiento
              onTap: () {
                // Lógica para editar la fecha de nacimiento
              },
            ),
            ListTile(
              title: Text('Contraseña: ********'), // Cambia esto por la contraseña del usuario
              trailing: Icon(Icons.edit), // Icono para editar la contraseña
              onTap: () {
                // Lógica para editar la contraseña
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el historial de pedidos
                  },
                  child: Text('Historial de Pedidos'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el contacto
                  },
                  child: Text('Contacto'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
