import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

// Enumeración para definir las propiedades de la animación
enum AniProps { opacity, translateY }

class FadeInAnimation extends StatelessWidget {
  // Retardo antes de iniciar la animación
  final double delay;
  // Widget hijo que será animado
  final Widget child;

  // Constructor de la clase FadeInAnimation
  const FadeInAnimation({
    super.key,
    required this.delay,  // Retardo requerido
    required this.child,  // Widget hijo requerido
  });

  @override
  Widget build(BuildContext context) {
    // Definición de la animación usando MovieTween
    final tween = MovieTween()
      ..tween<double>(AniProps.opacity, Tween<double>(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 500))  // Animación de opacidad
      ..tween<double>(
          AniProps.translateY, Tween<double>(begin: -30.0, end: 0.0),
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);  // Animación de traslación

    // Retorna el widget PlayAnimationBuilder que gestiona la animación
    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),  // Aplica el retardo antes de iniciar la animación
      duration: tween.duration,  // Duración total de la animación
      tween: tween,  // Define las propiedades de la animación
      child: child,  // Widget hijo que será animado
      builder: (_, Movie value, Widget? child) {
        // Construye el widget animado
        return Opacity(
          opacity: value.get<double>(AniProps.opacity),  // Aplica la animación de opacidad
          child: Transform.translate(
            offset: Offset(0, value.get<double>(AniProps.translateY)),  // Aplica la animación de traslación
            child: child,  // Widget hijo final
          ),
        );
      },
    );
  }
}
