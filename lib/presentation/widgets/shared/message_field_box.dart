import 'package:flutter/material.dart'; // Importa el paquete Flutter

// Widget para el campo de entrada de mensajes
class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String>
      onValue; // Función de devolución de llamada para manejar el valor ingresado
  const MessageFieldBox({super.key, required this.onValue}); // Constructor

  @override
  Widget build(BuildContext context) {
    // Controlador de texto para el campo de entrada
    final textController = TextEditingController();
    // Nodo de enfoque para controlar el enfoque del campo de entrada
    final focusNode = FocusNode();

    // Establece el estilo del borde del campo de entrada
    // ignore: non_constant_identifier_names
    final OutlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
          color: Colors.transparent), // Color del borde transparente
      borderRadius:
          BorderRadius.circular(20), // Borde redondeado del campo de entrada
    );

    // Configuración de la decoración del campo de entrada
    final inputDecoration = InputDecoration(
      hintText:
          'End your message with a "??', // Texto de sugerencia dentro del campo de entrada
      enabledBorder:
          OutlineInputBorder, // Borde del campo de entrada cuando está habilitado
      focusedBorder:
          OutlineInputBorder, // Borde del campo de entrada cuando está enfocado
      filled: true, // El campo de entrada está lleno
      suffixIcon: IconButton(
        // Icono al final del campo de entrada
        icon: const Icon(Icons.send_outlined), // Icono de enviar
        onPressed: () {
          final textValue =
              textController.value.text; // Obtener el valor del texto ingresado
          textController.clear(); // Limpiar el campo de entrada
          onValue(
              textValue); // Llamar a la función de devolución de llamada con el valor ingresado
        },
      ),
    );
    
    // Retorna un campo de entrada de formulario
    return TextFormField(
      onTapOutside: (event) {
        focusNode
            .unfocus(); // Cuando se toca fuera del campo de entrada, desenfoca el nodo de enfoque
      },
      focusNode: focusNode, // Establece el nodo de enfoque del campo de entrada
      controller:
          textController, // Establece el controlador de texto del campo de entrada
      decoration:
          inputDecoration, // Establece la decoración del campo de entrada
      onFieldSubmitted: (value) {
        textController
            .clear(); // Limpiar el campo de entrada cuando se envía el formulario
        focusNode
            .requestFocus(); // Establecer el enfoque en el campo de entrada
        onValue(
            value); // Llamar a la función de devolución de llamada con el valor ingresado
      },
    );
  }
}
