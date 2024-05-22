import 'package:flutter/material.dart';
import 'estructura_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Datos simulados
    final List<Map<String, String>> horario = [
      {'clase': 'Matemáticas', 'hora': '08:00 AM', 'dia': 'Lunes'},
      {'clase': 'Historia', 'hora': '10:00 AM', 'dia': 'Martes'},
      {'clase': 'Física', 'hora': '11:00 AM', 'dia': 'Miércoles'},
      {'clase': 'Química', 'hora': '09:00 AM', 'dia': 'Jueves'},
      {'clase': 'Educación Física', 'hora': '02:00 PM', 'dia': 'Viernes'},
    ];

    final List<String> deudasPendientes = [
      'Cuota de enero: \$200',
      'Cuota de febrero: \$200',
      'Materiales: \$50',
    ];

    final List<String> noticias = [
      'Reunión general de estudiantes el próximo viernes.',
      'Nuevo curso de programación disponible.',
      'Actualización del sistema el próximo fin de semana.',
    ];

    return EstructuraPage(
      pageTitle: '',
      pageContent: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionCard(
              title: 'Horario del Estudiante',
              icon: Icons.schedule,
              content: Column(
                children: horario.map((item) {
                  return ListTile(
                    leading: Icon(Icons.book),
                    title: Text(item['clase']!),
                    subtitle: Text('${item['dia']} - ${item['hora']}'),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            SectionCard(
              title: 'Información Económica',
              icon: Icons.attach_money,
              content: Column(
                children: deudasPendientes.map((deuda) {
                  return ListTile(
                    leading: Icon(Icons.warning, color: Colors.red),
                    title: Text(deuda),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            SectionCard(
              title: 'Noticias Importantes',
              icon: Icons.announcement,
              content: Column(
                children: noticias.map((noticia) {
                  return ListTile(
                    leading: Icon(Icons.info, color: Colors.blue),
                    title: Text(noticia),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget content;

  const SectionCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 28, color: Colors.blue),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            content,
          ],
        ),
      ),
    );
  }
}
