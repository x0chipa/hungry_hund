import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hungry_hund/core/app_color.dart';

class StarRatingBar extends StatelessWidget {
  // Puntuación inicial de la barra de calificación
  final double score;
  // Tamaño de cada estrella en la barra de calificación
  final double itemSize;

  // Constructor de la clase StarRatingBar
  const StarRatingBar({
    super.key,
    required this.score,
    this.itemSize = 20,  // Valor predeterminado del tamaño de la estrella
  });

  @override
  Widget build(BuildContext context) {
    // Construye el widget RatingBar con los parámetros especificados
    return RatingBar.builder(
      itemPadding: EdgeInsets.zero,  // Sin relleno entre las estrellas
      itemSize: itemSize,  // Tamaño de cada estrella
      initialRating: score,  // Puntuación inicial de la barra de calificación
      minRating: 1,  // Puntuación mínima permitida
      direction: Axis.horizontal,  // Dirección horizontal de la barra de calificación
      allowHalfRating: true,  // Permitir calificaciones con medias estrellas
      itemCount: 5,  // Número total de estrellas
      glow: false,  // Desactivar el efecto de resplandor al calificar
      ignoreGestures: true,  // Ignorar gestos para evitar cambios de calificación por el usuario
      itemBuilder: (_, __) => const Icon(
        Icons.star,
        size: 2.0,  // Tamaño del ícono de la estrella (este valor será sobrescrito por itemSize)
        color: AppColor.lightOrange,  // Color de la estrella
      ),
      onRatingUpdate: (rating) {},  // Función vacía porque los gestos están ignorados
    );
  }
}
