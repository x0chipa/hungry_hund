import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_style.dart';

class BottomBar extends StatelessWidget {
  // Función que se ejecuta al presionar el botón
  final VoidCallback? onTap;
  // Etiqueta del precio
  final String priceLabel;
  // Valor del precio
  final String priceValue;
  // Etiqueta del botón
  final String buttonLabel;

  // Constructor de la clase BottomBar
  const BottomBar({
    super.key,
    this.onTap,  // Función opcional para el botón
    this.priceLabel = "Precio",  // Etiqueta del precio predeterminada
    required this.priceValue,  // Valor del precio requerido
    this.buttonLabel = "Agregar al carrito",  // Etiqueta del botón predeterminada
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),  // Espaciado interno del contenedor
      height: 90,  // Altura del contenedor
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Espaciado entre los elementos
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,  // Alineación de los elementos al inicio
            children: [
              FittedBox(
                child: Text(
                  priceLabel,  // Etiqueta del precio
                  style: const TextStyle(
                    color: Colors.black45,  // Color del texto
                    fontWeight: FontWeight.bold,  // Peso de la fuente
                  ),
                ),
              ),
              const SizedBox(height: 5),  // Espaciado vertical entre la etiqueta y el valor del precio
              FittedBox(child: Text(priceValue, style: h2Style))  // Valor del precio con estilo
            ],
          ),
          ElevatedButton(onPressed: onTap, child: Text(buttonLabel))  // Botón con la etiqueta y acción
        ],
      ),
    );
  }
}
