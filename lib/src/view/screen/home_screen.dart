import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_color.dart';
import 'package:hungry_hund/core/app_data.dart';
import 'package:hungry_hund/src/view/screen/cart_screen.dart';
import 'package:hungry_hund/src/view/screen/profile_screen.dart';
import 'package:hungry_hund/src/view/screen/favorite_screen.dart';
import 'package:hungry_hund/src/controller/product_controller.dart';
import 'package:hungry_hund/src/view/screen/product_list_screen.dart';

// Inicializa el controlador de productos
final ProductController controller = Get.put(ProductController());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Lista de pantallas para el BottomNavigationBar
  final List<Widget> screens = const [
    ProductListScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            unselectedItemColor: Colors.grey,  // Color para los elementos no seleccionados
            currentIndex: controller.currentBottomNavItemIndex.value,  // Índice del elemento seleccionado
            showUnselectedLabels: true,  // Mostrar etiquetas para elementos no seleccionados
            onTap: controller.switchBetweenBottomNavigationItems,  // Acción al seleccionar un elemento
            fixedColor: AppColor.lightBlack,  // Color para el elemento seleccionado
            items: AppData.bottomNavigationItems
                .map(
                  (element) => BottomNavigationBarItem(
                    icon: element.icon,  // Icono del elemento
                    label: element.label,  // Etiqueta del elemento
                  ),
                )
                .toList(),
          );
        },
      ),
      // Muestra la pantalla correspondiente al índice seleccionado
      body: Obx(() => screens[controller.currentBottomNavItemIndex.value]),
    );
  }
}
