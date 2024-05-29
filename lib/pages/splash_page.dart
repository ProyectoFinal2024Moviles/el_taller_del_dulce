import 'package:el_taller_del_dulce/pages/navigation_menu.dart';
import 'package:el_taller_del_dulce/pages/register_page.dart';
import 'package:el_taller_del_dulce/pages/star_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  @override
  void initState() {
    _closeSplash();
    super.initState();
  }

  Future<void> _closeSplash() async {
    Future.delayed(const Duration(seconds: 2), () async{
      if(FirebaseAuth.instance.currentUser?.uid != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavigationMenu()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
      }}
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8BBD0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Center(
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            width: 150,
            height: 150,
          ),
        ),  
      ),
    );
  }
}
