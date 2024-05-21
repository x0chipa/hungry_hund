import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_color.dart';

class AppTheme {
  // Constructor privado para evitar la instanciación de la clase
  const AppTheme._();

  // Definición del tema claro de la aplicación
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,  // Color de fondo transparente para la AppBar
      elevation: 0,  // Sin sombra en la AppBar
      centerTitle: true,  // Centrar el título en la AppBar
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.lightBlack,  // Color de fondo para los botones elevados
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),  // Relleno interno del botón
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),  // Bordes redondeados del botón
        ),
      ),
    ),
  );
}
