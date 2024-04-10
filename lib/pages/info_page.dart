import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _msg = TextEditingController();

  void _onSendButtonClicked() {


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8BBD0),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/title.png',
              width: 20,
              height: 19,
            ),
            const SizedBox(width: 10),
            const Text(
              "El taller del dulce",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        // Hace que el fondo del AppBar sea transparente
        elevation: 0,
        // Quita la sombra del AppBar
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Ubicación y contacto",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  "Encuentra acá nuestro punto físico de venta",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Image(
                  image: AssetImage('assets/images/maps.png'),
                  width: 300,
                  height: 300,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 11, horizontal: 12),
                  ),
                  keyboardType: TextInputType.emailAddress,
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
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 11, horizontal: 12),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  controller: _msg,
                  maxLines: 5, // Define la altura máxima del cuadro de texto
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Mensaje',
                    contentPadding: EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                  ),
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    _onSendButtonClicked();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E63),
                  ),
                  child: const SizedBox(
                    width: 120, // Establece un ancho específico para el botón
                    child: Text(
                      "Enviar",
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
        ),
      ),
    );
  }
}

