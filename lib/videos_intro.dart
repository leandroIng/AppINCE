import 'package:flutter/material.dart';
import 'estructura_app.dart';

class VideoPage extends StatelessWidget {
  const VideoPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EstructuraPage(
      pageTitle: 'Inicio',
      pageContent: Center(
        child: Text(
          'Contenido de la página Videos',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
