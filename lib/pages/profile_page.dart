import 'package:el_taller_del_dulce/pages/info_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Importa el paquete image_picker
import 'dart:io'; // Importa dart:io para trabajar con archivos

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image; // Variable para almacenar la imagen seleccionada

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path); // Actualiza el estado con la nueva imagen
      });
    }
  }

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
              'Mi perfil',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null
                        ? FileImage(_image!) // Muestra la imagen seleccionada
                        : const NetworkImage('https://via.placeholder.com/150') as ImageProvider, // Muestra la imagen por defecto si no hay una seleccionada
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _pickImage, // Llama al método _pickImage cuando se presione el botón
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE91E63),
                    ),
                    child: const SizedBox(
                      width: 120,
                      child: Text(
                        "Cambiar imagen",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ),
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
              title: const Text('Nombre: Pedro Pérez'),
              trailing: const Icon(Icons.edit),
              onTap: () {
                // Lógica para editar el nombre
              },
            ),
            ListTile(
              title: const Text(
                  'Correo Electrónico: pedroperez@gmail.com'),
              trailing: const Icon(Icons.edit),
              onTap: () {
                // Lógica para editar el correo
              },
            ),
            ListTile(
              title: const Text(
                  'Fecha de Nacimiento: 01/01/1990'),
              trailing: const Icon(Icons.edit),
              onTap: () {
                // Lógica para editar la fecha de nacimiento
              },
            ),
            ListTile(
              title: const Text('Contraseña: ********'),
              trailing: const Icon(Icons.edit),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E63),
                  ),
                  child:  const SizedBox(
                    width: 120, // Establece un ancho específico para el botón
                    child: Text(
                      "Historial",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InfoPage())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E63),
                  ),
                  child:  const SizedBox(
                    width: 120, // Establece un ancho específico para el botón
                    child: Text(
                      "Contacto",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
