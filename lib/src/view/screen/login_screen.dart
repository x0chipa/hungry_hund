import 'package:flutter/material.dart';
import 'package:hungry_hund/src/view/screen/home_screen.dart';
import 'package:hungry_hund/src/view/screen/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iniciar Sesión"),  // Título de la AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Espaciado interno del cuerpo
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Centrar los hijos verticalmente
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Correo electrónico",  // Etiqueta para el campo de correo electrónico
                border: OutlineInputBorder(),  // Borde del campo de texto
              ),
            ),
            const SizedBox(height: 16),  // Espaciado vertical entre los campos de texto
            const TextField(
              decoration: InputDecoration(
                labelText: "Contraseña",  // Etiqueta para el campo de contraseña
                border: OutlineInputBorder(),  // Borde del campo de texto
              ),
              obscureText: true,  // Ocultar el texto para el campo de contraseña
            ),
            const SizedBox(height: 24),  // Espaciado vertical antes del botón de inicio de sesión
            ElevatedButton(
              onPressed: () {
                // Navegar a HomeScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
              child: const Text("Iniciar Sesión"),  // Texto del botón de inicio de sesión
            ),
            const SizedBox(height: 16),  // Espaciado vertical antes del botón de registro
            TextButton(
              onPressed: () {
                // Navegar a RegisterScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                );
              },
              child: const Text("¿No tienes una cuenta? Regístrate"),  // Texto del botón de registro
            ),
          ],
        ),
      ),
    );
  }
}
