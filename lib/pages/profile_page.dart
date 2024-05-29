import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:el_taller_del_dulce/pages/details_page.dart';
import 'package:el_taller_del_dulce/pages/info_page.dart';
import 'package:el_taller_del_dulce/pages/types_page.dart';
import 'package:flutter/material.dart';
import 'package:el_taller_del_dulce/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  UserDulce? user;
  File? image;
  //final uid = FirebaseAuth.instance.currentUser?.uid;
  //final _nameUser = FirebaseFirestore.instance.collection("users").doc(uid).get('name');
  //final _dateUser = FirebaseFirestore.instance.collection("users").doc(uid).get('date');

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get();
      setState(() {
       // user = UserDulce.fromFirestore(userDoc);
      });
    }
  }

  Future pickImage() async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState((){
        this.image = imageTemp;
      });
    } on PlatformException catch (e){
      print('faile to pick image: $e');
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
              'Perfil',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Column( //añadoendo imagen del usuario
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: image != null
                        ? FileImage(image!) // Muestra la imagen seleccionada
                        : const NetworkImage('https://via.placeholder.com/150') as ImageProvider, // Muestra la imagen por defecto si no hay una seleccionada
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      //seleccionar imagen
                      pickImage();

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE91E63),
                    ),
                    child:  const SizedBox(
                      width: 120, // Establece un ancho específico para el botón
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

            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>?>>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text("Loading");
              }
              var user = snapshot.data!.data();
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Hola ${user?['name']}',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Correo eléctronico: ${user?['email']}',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Fecha de Nacimiento: ${user?['date']}',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            },
            ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed:_onCerrarButtonClicked,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E63),
                  ),
                  child:  const SizedBox(
                    width: 120, // Establece un ancho específico para el botón
                    child: Text(
                      "Cerrar Sesión",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed:_onCerrarButtonClicked,
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

  void _onCerrarButtonClicked() {
    AlertDialog alert = AlertDialog(
      title: const Text("Advertencia"),
      content: const Text("¿Está seguro que desea cerrar sesión?"),
      actions: <Widget>[

        TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancelar')),
        TextButton(
          child: const Text('Aceptar'),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

}
