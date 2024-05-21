import 'package:get/get.dart';
import 'package:hungry_hund/core/app_extension.dart';
import 'package:hungry_hund/src/model/product.dart';

class ProductController extends GetxController {
  // Índice actual del ítem seleccionado en el BottomNavigationBar
  RxInt currentBottomNavItemIndex = 0.obs;
  // Índice actual del ítem en el PageView
  RxInt currentPageViewItemIndicator = 0.obs;
  // Lista de productos en el carrito
  RxList<Product> cartProduct = <Product>[].obs;
  // Lista de productos favoritos
  RxList<Product> favoriteProductList = <Product>[].obs;
  // Precio total del carrito
  RxDouble totalPrice = 0.0.obs;

  // Método para cambiar entre los ítems del BottomNavigationBar
  void switchBetweenBottomNavigationItems(int currentIndex) {
    currentBottomNavItemIndex.value = currentIndex;
  }

  // Método para cambiar entre los ítems del PageView
  void switchBetweenPageViewItems(int currentIndex) {
    currentPageViewItemIndicator.value = currentIndex;
  }

  // Método para marcar o desmarcar un producto como favorito
  void isFavoriteProduct(Product product) {
    product.isFavorite = !product.isFavorite;  // Cambia el estado de favorito
    update();  // Actualiza el estado
    if (product.isFavorite) {
      favoriteProductList.add(product);  // Añade el producto a la lista de favoritos
    } else {
      favoriteProductList.removeWhere((element) => element == product);  // Remueve el producto de la lista de favoritos
    }
  }

  // Método para incrementar la cantidad de un producto en el carrito
  void increaseItem(Product product) {
    product.quantity++;  // Incrementa la cantidad del producto
    update();  // Actualiza el estado
    calculateTotalPrice();  // Calcula el precio total
  }

  // Método para decrementar la cantidad de un producto en el carrito
  void decreaseItem(Product product) {
    product.quantity = product.quantity-- < 1 ? 0 : product.quantity--;  // Decrementa la cantidad del producto
    calculateTotalPrice();  // Calcula el precio total
    update();  // Actualiza el estado
    if (product.quantity < 1) {
      cartProduct.removeWhere((element) => element == product);  // Remueve el producto del carrito si la cantidad es menor a 1
    }
  }

  // Método para añadir un producto al carrito
  void addToCart(Product product) {
    if (product.quantity > 0) {
      cartProduct.add(product);  // Añade el producto al carrito
      cartProduct.assignAll(cartProduct.distinctBy((item) => item));  // Elimina duplicados en la lista del carrito
      calculateTotalPrice();  // Calcula el precio total
    }
  }

  // Método para calcular el precio total del carrito
  void calculateTotalPrice() {
    totalPrice.value = 0;  // Reinicia el precio total
    for (var element in cartProduct) {
      totalPrice.value += element.quantity * element.price;  // Suma el precio de cada producto al total
    }
  }

  // Método para limpiar el carrito
  void clearCart() {
    cartProduct.clear();  // Limpia la lista de productos en el carrito
    totalPrice.value = 0;  // Reinicia el precio total
    update();  // Actualiza el estado
  }
}
