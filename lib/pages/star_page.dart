import 'package:flutter/material.dart';
import 'login_page.dart';
import 'navigation_menu.dart';
import 'register_page.dart';
import 'home_page.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  void _onRegisterButtonClicked() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 0), // Espaciado en la parte superior
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF8BBD0), // Color de fondo rosado
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(
                        100.0), // Bordes circulares solo en el borde inferior derecho
                  ), // Bordes circulares
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20, // Espacio entre el título y el texto
                      ),
                      const Text(
                        "Sabor\nartesanal\nen cada\nrebanada",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30, // Espacio entre la imagen y el botón
                      ),
                      Container(
                        height: 150, // Altura máxima de la columna
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .end, // Alineación hacia la derecha
                          children: <Widget>[
                            Image.asset(
                              'assets/images/logo.png',
                              width: 150,
                              height: 150,
                            ),
                            SizedBox(
                                width:
                                    100), // Agrega un espacio a la derecha de la imagen
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 70, // Espacio entre la imagen y el botón
              ),
              ElevatedButton(
                onPressed: _onRegisterButtonClicked,
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return const Color(0xFFE91E63);
                    },
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage())
                    );

                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFE91E63)),
                  ),
                  child: const SizedBox(
                    width: 120, // Establece un ancho específico para el botón
                    child: Text(
                      "Registrarme →",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage())
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
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
              const SizedBox(height: 8.0),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
