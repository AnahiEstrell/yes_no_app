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
      crossAxisAlignment:
          CrossAxisAlignment.end, // Alineación cruzada al final (a la derecha)
      children: [
        // Contenedor para el mensaje de texto
        Container(
          // Contenedor para el mensaje de texto
          decoration: BoxDecoration(
            color: colors.primary, // Color de fondo del contenedor
            borderRadius:
                BorderRadius.circular(20), // Borde redondeado del contenedor
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10), // Espaciado interno del contenedor
            child: Text(
              message.text, // Texto del mensaje
              style: const TextStyle(
                  color: Colors.white), // Estilo del texto (color blanco)
            ),
          ),
        ),
        const SizedBox(
          height:
              5, // Espaciado vertical entre el contenedor de mensaje y el siguiente elemento
        )
      ],
    );
  }
}
