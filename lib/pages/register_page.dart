import 'package:el_taller_del_dulce/models/User.dart';
import 'package:el_taller_del_dulce/repository/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _firebaseApi = FirebaseApi();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();
  final _fechaNacimiento = TextEditingController();
  String _bornDate = "";

  bool _obscurePassword = true;
  bool _obscureRepPassword = true;

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
      helpText: "Fecha de nacimiento",
    );

    if (newDate != null) {
      setState(() {
        _bornDate = _dateConverter(newDate);
        _fechaNacimiento.text = _bornDate.toString();
      });
    }
  }

  void _registerUser(String email, String password) async{
    var result = await _firebaseApi.registerUser(email,password);
    if (result == 'weak-password') {
      _showMgg('La Contraseña debe tener 6 o mas caracteres.');
    } else if (result == 'email-already-in-use') {
      _showMgg('Yaexiste una cuenta con ese correo electronico.');
    } else if (result == "invalid-email"){
      _showMgg("Correo electronico Invalido.");
    } else if (result == "network-request-failed"){
      _showMgg("Sin Conexión");
    } else{
      createUser(result);
    }
  }

  void createUser(Object? uid) async{
    var user = UserDulce(uid, _name.text, _email.text, _bornDate);
    var retult = await _firebaseApi.createUserInDB(user);
    //_saveUser(user);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
    _showMgg("Usuario Registrado Exitosamente");
  }

  void _showMgg(String msg){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
          label: 'Aceptar',
          onPressed: scaffold.hideCurrentSnackBar,
        ),
      )
    );
  }

  void _onRegisterButtonClicked() {
    setState(() {
      if (_email.text.isEmpty || _password.text.isEmpty) {
        _showMgg("Debe digitar correo electronico y contraseña");
      }else if (!_email.text.isValidEmail()) {
        _showMgg("El correo electronico es invalido");
      }else if(_password.text != _repPassword.text) {
        _showMgg("Las contraseñas son diferentes");
      }else if(_password.text.length < 6){
        _showMgg("La contraseña debe tener 6 o mas caracteres");
          }else {
            _registerUser(_email.text, _password.text);
          }
        }
    );
  }
  
  void _saveUser(UserDulce user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 130,
                  height: 130,
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                  ),
                  keyboardType: TextInputType.text,
                ),
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                  ),
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
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(),
                    labelText: 'Escribe una contraseña',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 11, horizontal: 12),
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
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
                  obscureText: _obscureRepPassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(),
                    labelText: 'Repite la contraseña',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 11, horizontal: 12),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureRepPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscureRepPassword = !_obscureRepPassword;
                        });
                      },
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    _onRegisterButtonClicked();
                  },
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
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const SizedBox(
                    width: 120,
                    child: Text(
                      "Registrarme",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
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



extension EmailValidator on String{
  bool isValidEmail(){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}


