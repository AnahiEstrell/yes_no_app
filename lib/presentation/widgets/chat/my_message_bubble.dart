import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

// Widget para la burbuja de mensaje propio
class MyMessageBubble extends StatelessWidget {
  final Message message; // Mensaje propio

  const MyMessageBubble({super.key, required this.message}); // Constructor

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme; // Colores del tema actual

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Contenedor para el mensaje de texto
        Container(
          decoration: BoxDecoration(
            color: colors.primary, // Color de fondo
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
        )
      ],
    );
  }
}
