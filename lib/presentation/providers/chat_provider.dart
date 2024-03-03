// Importaciones necesarias
import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart'; // Importa el helper para obtener respuestas de sí o no
import 'package:yes_no_app/domain/entities/message.dart'; // Importa la entidad de mensaje

// Clase ChatProvider que maneja la lógica del chat
class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController(); // Controlador de desplazamiento para la vista del chat
  final getYesNoAnswer = GetYesNoAnswer(); // Instancia de GetYesNoAnswer para obtener respuestas

  List<Message> messageList = [ // Lista de mensajes iniciales
    Message(text: 'Hola amor', fromWho: FromWho.me), // Mensaje de inicio del usuario
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me), // Segundo mensaje del usuario
  ];

  // Método para enviar un mensaje
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return; // Si el texto está vacío, no hacer nada
    final newMessage = Message(text: text, fromWho: FromWho.me); // Crear un nuevo mensaje del usuario
    messageList.add(newMessage); // Agregar el nuevo mensaje a la lista
    if (text.endsWith('?')) { // Si el mensaje termina con un signo de interrogación
      herReply(); // Obtener respuesta de la otra persona
    }
    notifyListeners(); // Notificar a los widgets que están escuchando
    moveScrollToBottom(); // Mover el scroll hacia abajo para mostrar el nuevo mensaje
  }

  // Método para obtener la respuesta de la otra persona
  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer(); // Obtener respuesta de sí o no
    messageList.add(herMessage); // Agregar la respuesta a la lista de mensajes
    notifyListeners(); // Notificar a los widgets que están escuchando
    moveScrollToBottom(); // Mover el scroll hacia abajo para mostrar la respuesta
  }

  // Método para mover el scroll hacia abajo
  void moveScrollToBottom() async {
    await Future.delayed(const Duration(microseconds: 100)); // Esperar un corto período de tiempo
    chatScrollController.animateTo( // Animar el scroll
        chatScrollController.position.maxScrollExtent, // Hasta el final del scroll
        duration: const Duration(milliseconds: 300), // Duración de la animación
        curve: Curves.easeIn); // Curva de la animación
  }
}