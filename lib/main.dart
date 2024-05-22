import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'perfil.dart';
import 'financiero_page.dart';
import 'horario_page.dart';
import 'seleccion_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universidad Ince',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Cambia el color base a azul oscuro
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/perfil': (context) => PerfilPage(),
        '/financiero': (context) => FinancieroPage(),
        '/horario': (context) => HorarioPage(),
        '/seleccion': (context) => SeleccionPage(),
      },
    );
  }
}
