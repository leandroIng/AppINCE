import 'package:flutter/material.dart';

class EstructuraPage extends StatelessWidget {
  final String pageTitle;
  final Widget pageContent;

  const EstructuraPage({
    Key? key,
    required this.pageTitle,
    required this.pageContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'ACCESO ESTUDIANTES INCE',
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Negrita
                  fontSize: 20, // Tamaño del texto
                  color: Colors.white, // Color del texto
                ),
              ),
              backgroundColor: Color(0xFF17376E), // Color del AppBar
              iconTheme: IconThemeData(color: Color(0xFFFF914D)), // Color del icono del menú
            ),
            drawer: Drawer(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                    child: DrawerHeader(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/perfil');
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/perfil.png'),
                              radius: 32,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Leandro Delgado Reyes', // Aca debe mostrarse el nombre del estudiante.
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '1973-0000', // aca debe mostrarse la matricula del estudiante.
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Inicio'),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => route.isFirst,
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text('Pagos'),
                    onTap: () {
                      Navigator.pushNamed(context, '/financiero');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.schedule),
                    title: Text('Horario Actual'),
                    onTap: () {
                      Navigator.pushNamed(context, '/horario');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text('Selección en línea'),
                    onTap: () {
                      Navigator.pushNamed(context, '/seleccion');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.video_library), // Icono de video
                    title:
                        Text('Videos Instructivos'), // Texto de la nueva opción
                    onTap: () {
                      Navigator.pushNamed(context,
                          '/videos'); // Agregar la acción para los videos instructivos aquí
                    },
                  ),
                  Spacer(), // Esto agrega un espacio flexible en la parte inferior
                  Container(
                    color: Color(0xFF17376E), // Color de fondo azul
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text(
                        'Cerrar Sesión',
                        style: TextStyle(
                          color: Colors
                              .white, // Color del texto blanco para resaltarlo
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (route) => route.isFirst,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              // Modificación para permitir desplazamiento
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      pageTitle,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  const SizedBox(height: 20),
                  pageContent,
                ],
              ),
            ),
          ),
        ),

        // PIE DE PAGINA
        Container(
          height: 30, // Altura más pequeña
          color: const Color(0xFF17376E), // Color del pie de página
        ),
      ],
    );
  }
}
