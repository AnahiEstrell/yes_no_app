import 'package:flutter/material.dart';

// Widget para el campo de entrada de mensajes
class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue; // Función para manejar el valor del campo
  const MessageFieldBox({super.key, required this.onValue}); // Constructor

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController(); // Controlador de texto
    final focusNode = FocusNode(); // Nodo de enfoque

    // Borde de entrada personalizado
    // ignore: non_constant_identifier_names
    final OutlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent), // Color del borde
      borderRadius: BorderRadius.circular(20), // Borde redondeado
    );

    // Decoración del campo de entrada
    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "??', // Texto de sugerencia
      enabledBorder: OutlineInputBorder, // Borde cuando está habilitado
      focusedBorder: OutlineInputBorder, // Borde cuando está enfocado
      filled: true, // Relleno activado
      suffixIcon: IconButton(
        // Icono en el extremo derecho
        icon: const Icon(Icons.send_outlined), // Icono de enviar
        onPressed: () {
          final textValue = textController.value.text; // Obtener el valor del campo
          textController.clear(); // Limpiar el campo de texto
          onValue(textValue); // Llamar a la función de manejo del valor del campo
        },
      ),
    );

    // Campo de texto para introducir el mensaje
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus(); // Quitar el enfoque del campo al tocar fuera de él
      },
      focusNode: focusNode, // Asignar el nodo de enfoque
      controller: textController, // Asignar el controlador de texto
      decoration: inputDecoration, // Asignar la decoración
      onFieldSubmitted: (value) {
        textController.clear(); // Limpiar el campo de texto
        focusNode.requestFocus(); // Establecer el foco en el campo de texto
        onValue(value); // Llamar a la función de manejo del valor del campo
      },
    );
  }
}
