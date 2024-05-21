import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_asset.dart';
import 'package:hungry_hund/core/app_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Sección expandida para centrar el contenido
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,  // Centrar los hijos verticalmente
              children: [
                Image.asset(
                  AppAsset.profilePic,  // Imagen de perfil del usuario
                  width: 350,  // Ancho de la imagen
                  height: 350,  // Altura de la imagen
                ),
                const SizedBox(height: 20),  // Espacio entre la imagen y la información del usuario
                const Text(
                  "Nombre del Usuario",
                  style: h2Style,  // Estilo para el nombre del usuario
                ),
                const SizedBox(height: 5),  // Espacio entre el nombre y el correo electrónico
                const Text(
                  "correo@ejemplo.com",
                  style: h4Style,  // Estilo para el correo electrónico del usuario
                ),
              ],
            ),
          ),
          // Texto adicional en la parte inferior
          const Text(
            "Hello World!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),  // Estilo para el texto "Hello World!"
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,  // Centrar los elementos horizontalmente
            children: [
              Image.asset(AppAsset.githubPic, width: 60),  // Imagen del icono de GitHub
              const SizedBox(width: 10),  // Espacio entre el icono y el texto
              const Text(
                "https://github.com/x0chipa",
                style: TextStyle(fontSize: 20),  // Estilo para la URL de GitHub
              )
            ],
          ),
          const SizedBox(height: 20),  // Espacio adicional en la parte inferior
        ],
      ),
    );
  }
}
