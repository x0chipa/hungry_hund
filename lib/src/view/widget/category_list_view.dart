import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_style.dart';

class CategoryListView extends StatefulWidget {
  // Lista de categorías a mostrar
  final List<String> categories;
  // Función que se ejecuta al seleccionar una categoría
  final Function(String) onCategoryTap;

  // Constructor de la clase CategoryListView
  const CategoryListView({
    super.key,
    required this.categories,  // Lista de categorías requerida
    required this.onCategoryTap,  // Función de selección de categoría requerida
  });

  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  // Categoría seleccionada inicialmente, por defecto es "All"
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,  // Altura del ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal,  // Dirección de desplazamiento horizontal
        itemCount: widget.categories.length,  // Número de categorías
        itemBuilder: (context, index) {
          final category = widget.categories[index];
          final isSelected = category == selectedCategory;  // Verifica si la categoría está seleccionada
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),  // Espaciado horizontal entre los elementos
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = category;  // Actualiza la categoría seleccionada
                });
                widget.onCategoryTap(category);  // Ejecuta la función de selección de categoría
              },
              child: Chip(
                label: Text(
                  category,
                  style: isSelected
                      ? h3Style.copyWith(color: Colors.white)  // Estilo para la categoría seleccionada
                      : h3Style.copyWith(color: Colors.black),  // Estilo para las categorías no seleccionadas
                ),
                backgroundColor: isSelected ? Colors.grey[400] : Colors.grey[200],  // Color de fondo del Chip
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),  // Bordes redondeados del Chip
                ),
                elevation: isSelected ? 10 : 0,  // Elevación del Chip si está seleccionado
              ),
            ),
          );
        },
      ),
    );
  }
}
