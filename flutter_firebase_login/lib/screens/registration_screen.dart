import 'package:flutter/material.dart';
import '../services/firebase_auth_service.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();

  void _register() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      await _authService.registerWithEmailAndPassword(email, password);
      // Mostrar mensaje de éxito o redirigir a otra pantalla
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registro exitoso')),
      );
    } catch (e) {
      // Manejar errores de registro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Correo electrónico'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
