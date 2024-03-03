import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

// Widget para la burbuja de mensaje de ella
class HerMessageBubble extends StatelessWidget {
  final Message message; // Mensaje recibido

  const HerMessageBubble({super.key, required this.message}); // Constructor

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme; // Colores del tema actual

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Contenedor para el mensaje de texto
        Container(
          decoration: BoxDecoration(
            color: colors.secondary, // Color de fondo
            borderRadius: BorderRadius.circular(20), // Borde redondeado
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text, // Texto del mensaje
              style: const TextStyle(color: Colors.white), // Estilo del texto
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),

        // Widget para la imagen (pendiente de implementar)

        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

// Widget para mostrar una imagen en una burbuja
// ignore: unused_element
class _ImageBubble extends StatelessWidget {
  final String imageUrl; // URL de la imagen

  const _ImageBubble(this.imageUrl); // Constructor

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Tamaño de la pantalla

    // Widget para mostrar la imagen en la burbuja
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Borde redondeado
      child: Image.network(
        imageUrl, // URL de la imagen
        width: size.width * 0.7, // Ancho de la imagen
        height: 150, // Altura de la imagen
        fit: BoxFit.cover, // Ajuste de la imagen
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child; // Si la imagen ya se ha cargado, mostrarla

          // Si la imagen aún se está cargando, mostrar un texto de espera
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Anahi Estrella esta enviando un mensaje'), // Texto de espera
          );
        },
      ),
    );
  }
}
