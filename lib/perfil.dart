import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/perfil.png'), // Ruta de la imagen de perfil
              radius: 64, // Tamaño del círculo de la imagen de perfil
            ),
            SizedBox(height: 16),
            Text(
              'Leandro Delgado Reyes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              '1973-0000',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => route.isFirst,
                ); // Abre la ruta LoginPage y elimina todas las rutas anteriores excepto la ruta raíz
              },
              child: Text('Cerrar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
