import 'package:el_taller_del_dulce/pages/home_page.dart';
import 'package:el_taller_del_dulce/pages/navigation_menu.dart';
import 'package:el_taller_del_dulce/pages/register_page.dart';
import 'package:el_taller_del_dulce/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:el_taller_del_dulce/pages/types/tradicionales_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async{
  await Hive.initFlutter();
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'El taller del dulce',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale("es", "CO"), Locale("es", "US")],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFE91E63)),
        useMaterial3: true,
      ),
      initialRoute: '//',
      routes: {
        '//': (context) => NavigationMenu(),
      },
      home: const SplashPage(),
    );
  }
}
