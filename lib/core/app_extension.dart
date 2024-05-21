import 'package:flutter/material.dart';
import 'package:hungry_hund/src/view/widget/fade_in_animation.dart';

// Extensión para agregar funcionalidad a la clase String
extension StringExtension on String {
  // Método para agregar puntos suspensivos si la longitud del string es mayor a 15
  String get addOverFlow {
    if (length < 15) {
      return this;
    } else {
      return "${substring(0, 15)}...";
    }
  }
}

// Extensión para agregar funcionalidad a la clase Iterable
extension IterableExtension<T> on Iterable<T> {
  // Método para obtener una lista de elementos únicos basada en una propiedad de comparación
  Iterable<T> distinctBy(Object Function(T e) getCompareValue) {
    var result = <T>[];  // Lista para almacenar los elementos únicos
    forEach(
      (element) {
        // Verifica si el valor de comparación no está en la lista resultante
        if (!result.any((x) => getCompareValue(x) == getCompareValue(element))) {
          result.add(element);  // Agrega el elemento si no está en la lista
        }
      },
    );
    return result;
  }
}

// Extensión para agregar funcionalidad a la clase Widget
extension WidgetExtension on Widget {
  // Método para agregar una animación de desvanecimiento a un widget
  Widget fadeAnimation(double delay) {
    return FadeInAnimation(delay: delay, child: this);
  }
}
