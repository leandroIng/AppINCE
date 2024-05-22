import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Datos simulados de usuario y contraseña
  static const Map<String, String> users = {
    'Admin': 'Admin',
    'Usuario1': 'Contraseña1',
    'Usuario2': 'Contraseña2',
  };

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (users.containsKey(username) && users[username] == password) {
      // Si las credenciales son válidas, redirige a la página de inicio
      Navigator.pushNamed(context, '/home');
    } else {
      // Si las credenciales son incorrectas, muestra un mensaje de error
      _showErrorDialog('Usuario o contraseña incorrectos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/LogoInceB.png',
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Acceso Estudiantes',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Usuario o Matricula',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),
                      obscureText: _obscurePassword,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _login,
                    child: Text('Iniciar Sesión'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Recuperar Contraseña'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Para recuperar tu contraseña, debes comunicarte con el administrador.',
                                  style: TextStyle(color: Colors.black),
                                ),
                                const SizedBox(height: 8),
                                Text('Teléfono: 809 540 7300'),
                                Text('Correo: tic@ince.edu.do'),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cerrar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      '¿Haz olvidado tu contraseña?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();

    // Dibujar el rectángulo azul en la parte superior
    paint.color = Color(0xFF17376E); // Color azul
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Dibujar la curva de J naranja en la parte inferior
    paint.color = Color(0xFFFF914D); // Color naranja
    final Path path = Path();
    path.moveTo(0, size.height * 0.65); // Ajustar la posición hacia arriba
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.85, size.width * 0.5, size.height * 0.9);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.95, size.width, size.height * 0.85);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
