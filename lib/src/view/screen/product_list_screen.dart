import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_data.dart';
import 'package:hungry_hund/core/app_style.dart';
import 'package:hungry_hund/src/model/product.dart';
import 'package:hungry_hund/src/view/screen/product_detail_screen.dart';
import 'package:hungry_hund/src/view/widget/category_list_view.dart';
import 'package:hungry_hund/src/view/widget/product_list_view.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // Controlador para el campo de búsqueda
  TextEditingController searchController = TextEditingController();
  // Categoría seleccionada inicialmente
  String selectedCategory = "All";
  // Lista de productos filtrados
  List<Product> filteredProductList = AppData.productList;

  @override
  void initState() {
    super.initState();
    // Añade el listener para filtrar productos cuando cambie el texto en el campo de búsqueda
    searchController.addListener(_filterProduct);
    _filterProduct();
  }

  @override
  void dispose() {
    // Remueve el listener y libera el controlador de búsqueda
    searchController.removeListener(_filterProduct);
    searchController.dispose();
    super.dispose();
  }

  // Método para filtrar la lista de productos basado en la búsqueda y la categoría seleccionada
  void _filterProduct() {
    setState(() {
      String query = searchController.text.toLowerCase();  // Texto de búsqueda en minúsculas
      filteredProductList = AppData.productList.where((product) {
        bool matchesCategory = selectedCategory == "All" || product.category == selectedCategory;
        bool matchesSearch = product.title.toLowerCase().contains(query);
        return matchesCategory && matchesSearch;
      }).toList();
    });
  }

  // Método que se ejecuta al seleccionar una categoría
  void onCategoryTap(String category) {
    setState(() {
      selectedCategory = category;
      _filterProduct();
    });
  }

  // Método para construir la AppBar personalizada
  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),  // Tamaño preferido de la AppBar
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Espaciado entre los elementos
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,  // Alineación al inicio
                children: [
                  Text("Hello World", style: h2Style),  // Título principal
                  Text("Ya comiste perro?", style: h3Style),  // Subtítulo
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu))  // Botón de menú
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir la barra de búsqueda
  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: searchController,  // Controlador del campo de búsqueda
        decoration: InputDecoration(
          hintText: 'Search',  // Texto de sugerencia
          prefixIcon: const Icon(Icons.search, color: Colors.grey),  // Icono de búsqueda
          suffixIcon: const Icon(Icons.menu, color: Colors.grey),  // Icono de menú
          contentPadding: const EdgeInsets.all(20),  // Espaciado interno del campo
          border: textFieldStyle,  // Estilo del borde del campo
          focusedBorder: textFieldStyle,  // Estilo del borde cuando el campo está enfocado
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Método para navegar a la pantalla de detalles del producto
    Future<Widget?> navigate(Product product) {
      return Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),  // Duración de la transición
          pageBuilder: (_, __, ___) => ProductDetailScreen(product: product),  // Constructor de la pantalla de detalles
        ),
      );
    }

    return Scaffold(
      appBar: _appBar(),  // AppBar personalizada
      body: Padding(
        padding: const EdgeInsets.all(15),  // Espaciado alrededor del cuerpo
        child: ListView(
          children: [
            // Widget de lista de categorías
            CategoryListView(
              categories: const ["All", "Hamburguesas", "Pizzas", "Bebidas"],
              onCategoryTap: onCategoryTap,
            ),
            const SizedBox(height: 15),  // Espaciado entre los widgets
            _searchBar(),  // Barra de búsqueda
            // Lista de productos filtrados o mensaje si no hay productos
            filteredProductList.isNotEmpty
                ? ProductListView(
                    productList: filteredProductList,
                    onTap: navigate,
                  )
                : const Center(
                    child: Text(
                      'Aun no tenemos de eso...',  // Mensaje cuando no hay productos
                      style: h2Style,
                    ),
                  ),
            const Text("Popular", style: h2Style),  // Texto de sección
            // Lista de productos populares o mensaje si no hay productos
            filteredProductList.isNotEmpty
                ? ProductListView(
                    productList: filteredProductList,
                    isHorizontal: false,
                    onTap: navigate,
                  )
                : const Center(
                    child: Text(
                      'No hay nada por aquí...',  // Mensaje cuando no hay productos populares
                      style: h2Style,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
