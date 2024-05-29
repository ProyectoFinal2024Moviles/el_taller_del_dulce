import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersonalizadasPage extends StatefulWidget {
  @override
  _PersonalizadasPageState createState() => _PersonalizadasPageState();
}

class _PersonalizadasPageState extends State<PersonalizadasPage> {
  final TextEditingController _chatController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final ImagePicker _picker = ImagePicker();

  void _sendMessage() {
    if (_chatController.text.isNotEmpty) {
      setState(() {
        _messages.add({'text': _chatController.text, 'isImage': false});
        _chatController.clear();
      });
    }
  }

  Future<void> _sendImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _messages.add({'text': pickedFile.path, 'isImage': true});
      });
    }
  }

  Future<void> _launchWhatsApp() async {
    const phoneNumber = '+573023421308';
    const message = 'Hola, me gustaría personalizar una torta.';
    final url =
        'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        toolbarHeight: 60,
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.whatsapp),
            onPressed: _launchWhatsApp,
            color: Colors.white,
            iconSize: 30.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF8BBD0),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100.0),
                  ),
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
                            "Personalizadas",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Descripción",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "En esta sección podrás dirigirte a nuestro whatsapp para hablar con un asesor y personalizar tu torta a medida. Elige el "
                        "tamaño, sabores y decoración y haz todas las preguntas que necesites sobre tiempos de entrega "
                        "y precios. También puedes compartir fotos para inspirar el diseño de tu torta.",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
