import 'package:flutter/material.dart';
import 'estructura_app.dart';

class HorarioPage extends StatelessWidget {
  const HorarioPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EstructuraPage(
      pageTitle: 'Horario Actual',
      pageContent: Center(
        child: Text(
          'Contenido de la página Horario',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
