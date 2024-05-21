import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_asset.dart';
import 'package:hungry_hund/core/app_style.dart';

// Enumeración para definir los tipos de widget vacío
enum EmptyWidgetType { cart, favorite }

class EmptyWidget extends StatelessWidget {
  // Tipo de widget vacío (carrito o favorito)
  final EmptyWidgetType type;
  // Título a mostrar en el widget vacío
  final String title;

  // Constructor de la clase EmptyWidget
  const EmptyWidget({
    super.key,
    this.type = EmptyWidgetType.cart,  // Tipo predeterminado es carrito
    required this.title,  // Título requerido
  });

  @override
  Widget build(BuildContext context) {
    // Construye el widget centrado
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,  // Centra los hijos verticalmente
        children: [
          // Muestra la imagen correspondiente según el tipo de widget vacío
          type == EmptyWidgetType.cart
              ? Expanded(child: Image.asset(AppAsset.emptyCart))  // Imagen de carrito vacío
              : Image.asset(AppAsset.emptyFavorite),  // Imagen de favorito vacío
          const SizedBox(height: 10),  // Espacio entre la imagen y el texto
          Text(title, style: h2Style)  // Muestra el título con el estilo h2
        ],
      ),
    );
  }
}
