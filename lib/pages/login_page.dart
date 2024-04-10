import 'package:el_taller_del_dulce/pages/customized_page.dart';
import 'package:el_taller_del_dulce/pages/details_page.dart';
import 'package:el_taller_del_dulce/pages/home_page.dart';
import 'package:el_taller_del_dulce/pages/navigation_menu.dart';
import 'package:el_taller_del_dulce/pages/register_page.dart';
import 'package:el_taller_del_dulce/pages/customized_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _password = TextEditingController();
  final _email = TextEditingController();
  bool _obscurePassword = true;


  void _onLoginButtonClicked() {
    setState(() {
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) => DetailsPage()));
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(
                      image: AssetImage('assets/images/logo.png'),
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text(
                    "Iniciar Sesión",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Correo electrónico",
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Correo Electronico',
                      contentPadding: EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Contraseña",
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    controller: _password,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(),
                        labelText: 'Contraseña',
                        contentPadding: const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _onLoginButtonClicked();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE91E63),
                    ),
                    child: const SizedBox(
                      width: 120, // Establece un ancho específico para el botón
                      child: Text(
                        "Iniciar sesión →",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                          ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage())
                        );
                      },
                      child:
                      const Text('Registrarme →',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      )
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NavigationMenu())
                        );
                      },
                      child: const Text('Continuar sin iniciar sesión →',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      )
                        // const Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: <Widget>[
                        //   Text('Continuar sin iniciar sesión'),
                          // Image.asset(
                          //     'assets/image/rigt-arow.png'
                          //     width: 10,
                          //     heigth: 10
                          // ),

                        // ]
                      // ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}


