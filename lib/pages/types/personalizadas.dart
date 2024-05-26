import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
                        "En esta sección podrás comunicarte con un asesor para personalizar tu torta a medida. Elige el "
                        "tamaño, sabores y decoración y haz todas las preguntas que necesites sobre tiempos de entrega "
                        "y precios. También puedes compartir fotos para inspirar el diseño de tu torta.",
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 500,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8BBD0),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: _messages[index]['isImage']
                                ? Image.file(
                                    File(_messages[index]['text']),
                                    fit: BoxFit.cover,
                                  )
                                : Text(_messages[index]['text']),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: _sendImage,
                            color: Colors.pink,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Escribe un mensaje...',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide
                                      .none, // Elimina el borde por defecto
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal:
                                        20), // Ajusta el padding interno
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.send),
                            onPressed: _sendMessage,
                            color: Colors.pink,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
