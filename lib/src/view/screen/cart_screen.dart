import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungry_hund/core/app_color.dart';
import 'package:hungry_hund/core/app_style.dart';
import 'package:hungry_hund/src/controller/product_controller.dart';
import 'package:hungry_hund/src/view/screen/home_screen.dart';
import 'package:hungry_hund/src/view/widget/bottom_bar.dart';
import 'package:hungry_hund/src/view/widget/cart_list_view.dart';
import 'package:hungry_hund/src/view/widget/counter_button.dart';
import 'package:hungry_hund/src/view/widget/empty_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  // Método para construir la AppBar
  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text("Carrito", style: h2Style),  // Título de la AppBar con estilo h2
      actions: [
        IconButton(
          splashRadius: 20.0,
          onPressed: controller.clearCart,  // Acción para limpiar el carrito
          icon: const Icon(Icons.delete, color: AppColor.lightBlack),  // Icono de borrar
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),  // AppBar personalizada
      bottomNavigationBar: Obx(
        () {
          return BottomBar(
            priceLabel: "Total price",
            priceValue: "\$${controller.totalPrice.value.toStringAsFixed(2)}",  // Precio total del carrito
            buttonLabel: "Checkout",
            onTap: controller.totalPrice > 0
                ? () {
                    // Limpia el carrito
                    controller.clearCart();
                    // Muestra un mensaje de compra realizada
                    Get.snackbar(
                      'Compra realizada',
                      'Tu compra se ha realizado con éxito',
                      backgroundColor: Colors.black,
                      colorText: Colors.white,
                    );
                    // Navega a la pantalla de inicio
                    Get.offAll(() => const HomeScreen());
                  }
                : null,  // Deshabilita el botón si el total es 0
          );
        },
      ),
      body: GetBuilder<ProductController>(
        builder: (controller) {
          return controller.cartProduct.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(15),  // Espaciado alrededor del cuerpo
                  child: CartListView(
                    productItems: controller.cartProduct,  // Lista de productos en el carrito
                    counterButton: (product) {
                      return CounterButton(
                        orientation: Axis.vertical,
                        onIncrementSelected: () => controller.increaseItem(product),  // Incrementar cantidad
                        onDecrementSelected: () => controller.decreaseItem(product),  // Decrementar cantidad
                        label: product.quantity,  // Cantidad del producto
                      );
                    },
                  ),
                )
              : const EmptyWidget(title: "¿No se te antoja algo?");  // Mensaje cuando el carrito está vacío
        },
      ),
    );
  }
}
