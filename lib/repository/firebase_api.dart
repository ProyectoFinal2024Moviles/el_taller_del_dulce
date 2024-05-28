import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:el_taller_del_dulce/models/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApi{

  Future<String?> registerUser (String emailAddress, String password) async {
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
      );
      return result.user?.uid;
    } on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password') {
        print('La Contraseña debe tener 6 o mas caracteres.');
      } else if (e.code == 'email-already-in-use') {
        print('Yaexiste una cuenta con ese correo electronico.');
      } else if (e.code == "invalid-email"){
        print("Correo electronico Invalido.");
      } else if (e.code == "network-request-failed"){
        print("Sin Conexión");
      }
      return e.code;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String?> loginUser(String emailAddress, String password) async {
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return result.user?.uid;
    } on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password') {
        print('La Contraseña debe tener 6 o mas caracteres.');
      } else if (e.code == 'email-already-in-use') {
        print('Yaexiste una cuenta con ese correo electronico.');
      } else if (e.code == "invalid-email"){
        print("Correo electronico Invalido.");
      } else if (e.code == "network-request-failed"){
        print("Sin Conexión");
      }
      return e.code;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<Object?>  createUserInDB(UserDulce user) async {
    try{
      final document = await FirebaseFirestore.instance.collection("users").doc(user.uid).set(user.toJson());
      return user.uid;
    } on FirebaseException catch (e) {
      print("FirebaseEception ${e.code}");
      return e.code;
    }
  }

}