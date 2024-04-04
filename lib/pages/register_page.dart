import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();
  final _fechaNacimiento = TextEditingController();
  String _bornDate = "";

  String _dateConverter(DateTime newDate) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String dateFormatted = formatter.format(newDate);
    return dateFormatted;
  }

  void _showSelectedDate() async {
    final DateTime? newDate = await showDatePicker(
        context: context,
        locale: const Locale("es", "CO"),
        initialDate: DateTime(2024, 2),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2024, 3, 15),
        helpText: "Fecha de nacimiento");

    if (newDate != null) {
      setState(() {
        _bornDate = _dateConverter(newDate);
        _fechaNacimiento.text = _bornDate.toString();
      });
    }
  }

  /*void _showMsg(String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar',
            onPressed: () {
              _password.text = "";
              _repPassword.text = "";
            }),
      ),
    );
  }*/

  void _onRegisterButtonClicked() {
    setState(() {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8BBD0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  "Crear una cuenta",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nombre y apellido",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
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
                      labelText: 'Ej. Pedro Perez',
                      contentPadding: EdgeInsets.symmetric(vertical: 11, horizontal: 12),),
                    keyboardType: TextInputType.text),
                const SizedBox(
                  height: 8.0,
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
                      labelText: 'Ej. pedroperez@gmail.com',
                      contentPadding: EdgeInsets.symmetric(vertical: 11, horizontal: 12),),
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 8.0,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Fecha de nacimiento",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  controller: _fechaNacimiento,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Ej. 1985-02-25',
                    contentPadding: EdgeInsets.symmetric(vertical: 11, horizontal: 12),),
                  readOnly: true,
                  onTap: () {
                    _showSelectedDate();
                  },
                ),
                const SizedBox(
                  height: 8.0,
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
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Escribe una contraseña',
                      contentPadding: EdgeInsets.symmetric(vertical: 11, horizontal: 12),),
                    keyboardType: TextInputType.visiblePassword),
                const SizedBox(
                  height: 8.0,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Repetir contraseña",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                    controller: _repPassword,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Repite la contraseña',
                      contentPadding: EdgeInsets.symmetric(vertical: 11, horizontal: 12),),
                    keyboardType: TextInputType.visiblePassword),
                const SizedBox(
                  height: 8.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    _onRegisterButtonClicked();
                  },
                  style: ButtonStyle(
                    foregroundColor:
                    WidgetStateProperty.all<Color>(Colors.black),
                    backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                          (Set<WidgetState> states) {
                        if (states.contains(WidgetState.disabled)) {
                          return Colors.grey;
                        }
                        return const Color(0xFFE91E63);
                      },
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Establece los bordes cuadrados
                      ),
                    ),
                  ),
                  child: const SizedBox(
                    width: 120, // Establece un ancho específico para el botón (en este caso 200)
                    child: Text("Registrarme", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
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
