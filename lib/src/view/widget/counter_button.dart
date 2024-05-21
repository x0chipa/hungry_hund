import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_style.dart';

class CounterButton extends StatelessWidget {
  // Función que se ejecuta al incrementar el contador
  final Function() onIncrementSelected;
  // Función que se ejecuta al decrementar el contador
  final Function() onDecrementSelected;
  // Etiqueta que muestra el valor del contador
  final int label;
  // Orientación del contador (horizontal o vertical)
  final Axis orientation;

  // Constructor de la clase CounterButton
  const CounterButton({
    super.key,
    required this.onIncrementSelected,  // Función de incremento requerida
    required this.onDecrementSelected,  // Función de decremento requerida
    required this.label,  // Valor del contador requerido
    this.orientation = Axis.horizontal,  // Orientación predeterminada es horizontal
  });

  // Método para crear un botón con icono
  Widget button(Icon icon, Function() onTap) {
    return RawMaterialButton(
      constraints: BoxConstraints.tight(const Size(36, 36)),  // Tamaño del botón
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),  // Forma del botón con bordes redondeados
      fillColor: Colors.white,  // Color de fondo del botón
      onPressed: () => onTap(),  // Acción al presionar el botón
      child: icon,  // Icono dentro del botón
    );
  }

  // Método para construir el cuerpo del widget, que contiene los botones y la etiqueta
  List<Widget> body() {
    return [
      button(const Icon(Icons.remove), onDecrementSelected),  // Botón de decremento
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),  // Espaciado horizontal alrededor de la etiqueta
        child: Text("$label", style: h2Style.copyWith(fontSize: 15)),  // Etiqueta del contador
      ),
      button(const Icon(Icons.add), onIncrementSelected),  // Botón de incremento
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Construye el widget dependiendo de la orientación (horizontal o vertical)
    return orientation == Axis.horizontal
        ? Row(mainAxisAlignment: MainAxisAlignment.end, children: body())  // Contador en fila
        : Column(children: body().reversed.toList());  // Contador en columna, invirtiendo el orden de los elementos
  }
}
