import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_style.dart';
import 'package:hungry_hund/core/app_extension.dart';
import 'package:hungry_hund/src/model/product.dart';
import 'package:hungry_hund/src/view/widget/rating_bar.dart';

class ProductListView extends StatelessWidget {
  // Indica si la lista de productos se muestra horizontalmente
  final bool isHorizontal;
  // Función que se ejecuta al presionar un producto
  final Function(Product product)? onTap;
  // Lista de productos a mostrar
  final List<Product> productList;

  // Constructor de la clase ProductListView
  const ProductListView({
    super.key,
    this.isHorizontal = true,  // Valor predeterminado para mostrar la lista horizontalmente
    this.onTap,
    required this.productList,  // Lista de productos requerida
  });

  // Método para mostrar la calificación del producto
  Widget _productScore(Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StarRatingBar(score: product.score),  // Barra de calificación
        const SizedBox(width: 10),
        Text(product.score.toString(), style: h4Style),  // Puntuación del producto
      ],
    ).fadeAnimation(1.0);  // Animación de desvanecimiento
  }

  // Método para mostrar la imagen del producto
  Widget _productImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),  // Bordes redondeados para la imagen
      child: Image.asset(image, width: 150, height: 150, fit: BoxFit.cover),  // Imagen del producto
    ).fadeAnimation(0.4);  // Animación de desvanecimiento
  }

  // Método para crear un ítem de la lista de productos
  Widget _listViewItem(Product product, int index) {
    Widget widget;
    // Verifica si la lista es horizontal o vertical
    widget = isHorizontal
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(tag: index, child: _productImage(product.images[0])),  // Imagen del producto con animación Hero
              const SizedBox(height: 10),
              Text(product.title.addOverFlow, style: h4Style, textAlign: TextAlign.center).fadeAnimation(0.8),  // Título del producto
              const SizedBox(height: 5),
              _productScore(product),  // Calificación del producto
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _productImage(product.images[0]),  // Imagen del producto
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title, style: h4Style).fadeAnimation(0.8),  // Título del producto
                      const SizedBox(height: 5),
                      _productScore(product),  // Calificación del producto
                      const SizedBox(height: 5),
                      Text(
                        product.description,
                        style: h5Style.copyWith(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,  // Descripción del producto con límite de líneas y desbordamiento elíptico
                      ).fadeAnimation(1.4),
                    ],
                  ),
                ),
              ),
            ],
          );

    // Retorna un GestureDetector para detectar toques en el ítem de la lista
    return GestureDetector(
      onTap: () => onTap?.call(product),  // Llama a la función onTap si está definida
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Verifica si la lista es horizontal para usar un CarouselSlider
    return isHorizontal
        ? CarouselSlider.builder(
            itemCount: productList.length,  // Número de productos en la lista
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              Product product = productList[itemIndex];
              return _listViewItem(product, itemIndex);  // Crea el ítem de la lista
            },
            options: CarouselOptions(
              height: 240,  // Altura del carrusel
              scrollDirection: Axis.horizontal,  // Dirección de desplazamiento horizontal
              viewportFraction: 0.8,  // Fracción del carrusel visible
              enlargeCenterPage: true,  // Agranda la página central
              enableInfiniteScroll: true,  // Habilita el desplazamiento infinito
              autoPlay: true,  // Habilita la reproducción automática
              autoPlayInterval: const Duration(seconds: 3),  // Intervalo de reproducción automática
              autoPlayAnimationDuration: const Duration(milliseconds: 800),  // Duración de la animación de reproducción automática
              autoPlayCurve: Curves.fastOutSlowIn,  // Curva de animación de reproducción automática
              aspectRatio: 3.0,  // Relación de aspecto del carrusel
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            reverse: true,
            physics: const ClampingScrollPhysics(),
            itemCount: productList.length,  // Número de productos en la lista
            itemBuilder: (_, index) {
              Product product = productList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 10),
                child: _listViewItem(product, index),  // Crea el ítem de la lista
              );
            },
          );
  }
}
