¡Perfecto! Aquí tienes el archivo README con secciones para las imágenes y una estructura de carpetas basada en tu proyecto:

---

# Hungry Hund

## Descripción

Hungry Hund es una aplicación Flutter diseñada para administrar productos, favoritos y carritos de compras. La aplicación incluye pantallas para la lista de productos, detalles del producto, carrito de compras, favoritos y perfil de usuario. Además, utiliza animaciones para mejorar la experiencia del usuario.

## Estructura del Proyecto

```
lib
├── core
│   ├── app_asset.dart
│   ├── app_color.dart
│   ├── app_data.dart
│   ├── app_extension.dart
│   ├── app_style.dart
│   ├── app_theme.dart
├── src
│   ├── controller
│   │   └── product_controller.dart
│   ├── model
│   │   └── bottom_navigation_item.dart
│   │   └── product.dart
│   ├── view
│   │   ├── screen
│   │   │   ├── cart_screen.dart
│   │   │   ├── favorite_screen.dart
│   │   │   ├── home_screen.dart
│   │   │   ├── intro_screen.dart
│   │   │   ├── login_screen.dart
│   │   │   ├── product_detail_screen.dart
│   │   │   ├── product_list_screen.dart
│   │   │   ├── profile_screen.dart
│   │   │   └── register_screen.dart
│   │   ├── widget
│   │   │   ├── bottom_bar.dart
│   │   │   ├── cart_list_view.dart
│   │   │   ├── category_list_view.dart
│   │   │   ├── counter_button.dart
│   │   │   ├── empty_widget.dart
│   │   │   ├── fade_in_animation.dart
│   │   │   ├── product_list_view.dart
│   │   │   └── rating_bar.dart
└── main.dart
```

## Instalación

1. Clona el repositorio:
    ```bash
    git clone https://github.com/tu_usuario/hungry_hund.git
    ```
2. Navega al directorio del proyecto:
    ```bash
    cd hungry_hund
    ```
3. Instala las dependencias:
    ```bash
    flutter pub get
    ```

## Uso

Ejecuta la aplicación en un emulador o dispositivo físico:
```bash
flutter run
```

## Funcionalidades

### Pantallas

1. **IntroScreen**: Pantalla de introducción con opciones para navegar a las pantallas de inicio de sesión y registro.
    ```dart
    class IntroScreen extends StatelessWidget {
        // ...
    }
    ```

2. **LoginScreen**: Pantalla de inicio de sesión.
    ```dart
    class LoginScreen extends StatelessWidget {
        // ...
    }
    ```

3. **RegisterScreen**: Pantalla de registro de usuario.
    ```dart
    class RegisterScreen extends StatelessWidget {
        // ...
    }
    ```

4. **HomeScreen**: Pantalla principal con navegación inferior para acceder a productos, carrito, favoritos y perfil.
    ```dart
    class HomeScreen extends StatelessWidget {
        // ...
    }
    ```

5. **ProductListScreen**: Pantalla que muestra la lista de productos disponibles.
    ```dart
    class ProductListScreen extends StatefulWidget {
        // ...
    }
    ```

6. **ProductDetailScreen**: Pantalla que muestra los detalles de un producto seleccionado.
    ```dart
    class ProductDetailScreen extends StatelessWidget {
        // ...
    }
    ```

7. **FavoriteScreen**: Pantalla que muestra los productos favoritos del usuario.
    ```dart
    class FavoriteScreen extends StatelessWidget {
        // ...
    }
    ```

8. **CartScreen**: Pantalla que muestra los productos en el carrito de compras.
    ```dart
    class CartScreen extends StatelessWidget {
        // ...
    }
    ```

9. **ProfileScreen**: Pantalla que muestra la información del perfil del usuario.
    ```dart
    class ProfileScreen extends StatelessWidget {
        // ...
    }
    ```

### Widgets

1. **EmptyWidget**: Widget reutilizable para mostrar cuando no hay elementos.
    ```dart
    class EmptyWidget extends StatelessWidget {
        // ...
    }
    ```

2. **ProductListView**: Widget para mostrar la lista de productos.
    ```dart
    class ProductListView extends StatelessWidget {
        // ...
    }
    ```

3. **CartListView**: Widget para mostrar la lista de productos en el carrito.
    ```dart
    class CartListView extends StatelessWidget {
        // ...
    }
    ```

4. **CounterButton**: Botón de contador para incrementar o decrementar la cantidad de productos.
    ```dart
    class CounterButton extends StatelessWidget {
        // ...
    }
    ```

5. **BottomBar**: Barra inferior personalizada para mostrar el precio total y un botón de acción.
    ```dart
    class BottomBar extends StatelessWidget {
        // ...
    }
    ```

6. **CategoryListView**: Widget para mostrar una lista de categorías.
    ```dart
    class CategoryListView extends StatefulWidget {
        // ...
    }
    ```

7. **FadeInAnimation**: Widget para aplicar una animación de desvanecimiento.
    ```dart
    class FadeInAnimation extends StatelessWidget {
        // ...
    }
    ```

### Controladores

1. **ProductController**: Controlador para manejar la lógica de productos, carrito y favoritos.
    ```dart
    class ProductController extends GetxController {
        // ...
    }
    ```

### Temas y Estilos

1. **AppTheme**: Definición del tema claro de la aplicación.
    ```dart
    class AppTheme {
        // ...
    }
    ```

2. **Estilos de Texto**: Definición de estilos de texto utilizados en la aplicación.
    ```dart
    const h1Style = TextStyle(
        // ...
    );

    const h2Style = TextStyle(
        // ...
    );

    const h3Style = TextStyle(
        // ...
    );

    const h4Style = TextStyle(
        // ...
    );

    const h5Style = TextStyle(
        // ...
    );

    const bodyStyle1 = TextStyle(
        // ...
    );

    final textFieldStyle = OutlineInputBorder(
        // ...
    );
    ```

### Extensiones

1. **StringExtension**: Extensión para agregar funcionalidad adicional a la clase String.
    ```dart
    extension StringExtension on String {
        // ...
    }
    ```

2. **IterableExtension**: Extensión para agregar funcionalidad adicional a la clase Iterable.
    ```dart
    extension IterableExtension<T> on Iterable<T> {
        // ...
    }
    ```

3. **WidgetExtension**: Extensión para agregar funcionalidad adicional a la clase Widget.
    ```dart
    extension WidgetExtension on Widget {
        // ...
    }
    ```

## Imágenes

### Pantalla de Introducción
![image](https://github.com/x0chipa/hungry_hund/assets/68248983/e515a13e-2f2c-41e2-8939-807323ad7d74)


### Pantalla de Inicio de Sesión
![image](https://github.com/x0chipa/hungry_hund/assets/68248983/00473c2a-3d8e-49cf-bdf8-5f382478ef6e)


### Pantalla de Registro
![image](https://github.com/x0chipa/hungry_hund/assets/68248983/d1950463-3a41-463d-a88b-c5282ad266a0)


### Pantalla Principal
![image](https://github.com/x0chipa/hungry_hund/assets/68248983/960476f0-ebb3-4672-a53a-8172bf0bb231)


### Pantalla de Detalle de Producto
![image](https://github.com/x0chipa/hungry_hund/assets/68248983/0f80b200-ae38-4470-8cb1-91706c7a7bd3)


### Pantalla de Carrito
![image](https://github.com/x0chipa/hungry_hund/assets/68248983/6d0a081d-a3dc-4755-b7b0-44bcbfbff2d2)


### Pantalla de Favoritos
![image](https://github.com/x0chipa/hungry_hund/assets/68248983/3c742b41-75b8-4186-b544-b57f6a589fd7)


Asegúrate de reemplazar las rutas de las imágenes con las correctas según su ubicación en tu proyecto. Si necesitas más ayuda o ajustes, no dudes en decírmelo.
