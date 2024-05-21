import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_style.dart';
import 'package:hungry_hund/src/view/screen/home_screen.dart';
import 'package:hungry_hund/src/view/widget/empty_widget.dart';
import 'package:hungry_hund/src/view/widget/product_list_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favoritos", style: h2Style)),  // Título de la AppBar con estilo h2
      body: Padding(
        padding: const EdgeInsets.all(15),  // Espaciado alrededor del cuerpo
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - kToolbarHeight,  // Altura de la pantalla menos la altura de la AppBar
            child: Column(
              mainAxisAlignment: controller.favoriteProductList.isNotEmpty 
                  ? MainAxisAlignment.start  // Alinea los hijos al inicio si la lista no está vacía
                  : MainAxisAlignment.center,  // Centra los hijos si la lista está vacía
              children: [
                controller.favoriteProductList.isNotEmpty
                    ? ProductListView(
                        isHorizontal: false,
                        productList: controller.favoriteProductList,
                      )  // Muestra la lista de productos favoritos si no está vacía
                    : const EmptyWidget(
                        type: EmptyWidgetType.favorite,
                        title: "Aun no tienes favoritos",
                      )  // Muestra un widget vacío si no hay productos favoritos
              ],
            ),
          ),
        ),
      ),
    );
  }
}
