import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_style.dart';
import 'package:hungry_hund/core/app_extension.dart';
import 'package:hungry_hund/src/model/product.dart';

class CartListView extends StatelessWidget {
  // Constructor de la clase CartListView
  const CartListView({
    super.key,
    required this.counterButton,  // Función para crear el botón del contador
    required this.productItems,  // Lista de productos requerida
  });

  final Widget Function(Product product) counterButton;  // Función que retorna un widget basado en el producto
  final List<Product> productItems;  // Lista de productos en el carrito

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: productItems.length,  // Número de elementos en la lista
      itemBuilder: (_, index) {
        Product product = productItems[index];  // Producto actual
        return Padding(
          padding: const EdgeInsets.all(15),  // Espaciado alrededor del elemento de la lista
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,  // Espaciado uniforme entre los elementos del Row
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),  // Bordes redondeados para la imagen del producto
                  child: Image.asset(product.images[0]),  // Imagen del producto
                ),
              ),
              const SizedBox(width: 5),  // Espaciado horizontal entre la imagen y el texto
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,  // Alineación de los elementos al inicio
                children: [
                  Text(product.title.addOverFlow, style: h4Style),  // Título del producto con estilo y desbordamiento
                  const SizedBox(height: 5),  // Espaciado vertical entre el título y el precio
                  Text("\$${product.price}", style: h2Style),  // Precio del producto con estilo
                  const SizedBox(height: 5),  // Espaciado vertical adicional
                ],
              ),
              // Botón del contador para el producto actual
              counterButton(product)
            ],
          ).fadeAnimation(0.4 * index),  // Animación de desvanecimiento para cada elemento
        );
      },
      separatorBuilder: (_, __) {
        return const Padding(padding: EdgeInsets.only(bottom: 15));  // Espaciado entre los elementos de la lista
      },
    );
  }
}
