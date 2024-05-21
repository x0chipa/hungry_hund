import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_style.dart';
import 'package:hungry_hund/src/view/screen/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,  // No mostrar el botón de retroceso automático
        centerTitle: false,  // No centrar el título
        title: const Text("Registrarse", style: h2Style),  // Título de la AppBar con estilo h2
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Espaciado interno del cuerpo
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Centrar los hijos verticalmente
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Nombre de usuario",  // Etiqueta para el campo de nombre de usuario
                border: OutlineInputBorder(),  // Borde del campo de texto
              ),
            ),
            const SizedBox(height: 16),  // Espaciado vertical entre los campos de texto
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
            const SizedBox(height: 24),  // Espaciado vertical antes del botón de registro
            ElevatedButton(
              onPressed: () {
                // Lógica de registro
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),  // Navegar a la pantalla principal
                  (route) => false,  // Remover todas las rutas anteriores
                );
              },
              child: const Text("Registrarse"),  // Texto del botón de registro
            ),
            const SizedBox(height: 16),  // Espaciado vertical antes del botón de inicio de sesión
            TextButton(
              onPressed: () {
                Navigator.pop(context);  // Volver a la pantalla anterior
              },
              child: const Text("¿Ya tienes una cuenta? Inicia sesión"),  // Texto del botón de inicio de sesión
            ),
          ],
        ),
      ),
    );
  }
}
