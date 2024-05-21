import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_color.dart';
import 'package:hungry_hund/core/app_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hungry_hund/core/app_extension.dart';
import 'package:hungry_hund/src/model/product.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hungry_hund/src/view/widget/rating_bar.dart';
import 'package:hungry_hund/src/view/screen/home_screen.dart';
import 'package:hungry_hund/src/view/widget/counter_button.dart';
import 'package:hungry_hund/src/controller/product_controller.dart';

class ProductDetailScreen extends StatelessWidget {
  // Producto a mostrar en la pantalla de detalles
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  // Método para construir la AppBar
  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      actions: [
        // Botón para marcar el producto como favorito
        GetBuilder<ProductController>(
          builder: (controller) {
            return IconButton(
              splashRadius: 18.0,
              onPressed: () => controller.isFavoriteProduct(product),
              icon: product.isFavorite
                  ? const Icon(Icons.bookmark, color: Colors.black)
                  : const Icon(Icons.bookmark_border, color: Colors.black),
            );
          },
        )
      ],
      leading: IconButton(
        icon: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
        onPressed: () {
          // Restablece el índice del indicador de la vista de página y regresa a la pantalla anterior
          controller.currentPageViewItemIndicator.value = 0;
          Navigator.pop(context);
        },
      ),
      title: Text(product.title, style: h2Style),
    );
  }

  // Método para construir la barra inferior con el precio y el botón de añadir al carrito
  Widget bottomBar() {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FittedBox(
                child: Text(
                  'Precio',
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              FittedBox(child: Text("\$${product.price}", style: h2Style))
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.lightBlack,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => controller.addToCart(product),
            child: const Text("Añadir al carrito"),
          )
        ],
      ),
    ).fadeAnimation(1.3);
  }

  // Método para construir el deslizador de imágenes del producto
  Widget productImageSlider(double height) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      height: height * 0.5,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            onPageChanged: controller.switchBetweenPageViewItems,
            itemCount: product.images.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: index,
                    child: Image.asset(
                      product.images[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
          ),
          // Indicador de página para el deslizador de imágenes
          Positioned(
            bottom: 20,
            child: Obx(
              () {
                return AnimatedSmoothIndicator(
                  effect: const WormEffect(
                    dotColor: Colors.white38,
                    activeDotColor: Colors.white,
                  ),
                  activeIndex: controller.currentPageViewItemIndicator.value,
                  count: product.images.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;  // Altura de la pantalla
    return WillPopScope(
      onWillPop: () async {
        // Restablece el índice del indicador de la vista de página al regresar
        controller.currentPageViewItemIndicator.value = 0;
        return Future.value(true);
      },
      child: Scaffold(
        bottomNavigationBar: bottomBar(),  // Barra inferior con el precio y el botón de añadir al carrito
        appBar: _appBar(context),  // AppBar personalizada
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productImageSlider(height),  // Deslizador de imágenes del producto
                Center(
                  child: StarRatingBar(
                    score: product.score,
                    itemSize: 25,
                  ).fadeAnimation(0.4),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: const Text(
                    "Descripción",
                    style: h2Style,
                    textAlign: TextAlign.end,
                  ).fadeAnimation(0.6),
                ),
                Text(
                  product.description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black45),
                ).fadeAnimation(0.8),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: GetBuilder<ProductController>(
                        builder: (controller) {
                          return CounterButton(
                            label: product.quantity,
                            onIncrementSelected: () => controller.increaseItem(product),
                            onDecrementSelected: () => controller.decreaseItem(product),
                          );
                        },
                      ),
                    )
                  ],
                ).fadeAnimation(1.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
