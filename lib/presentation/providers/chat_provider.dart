import 'package:flutter/material.dart'; // Importa el paquete Flutter
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart'; // Importa el helper para obtener la respuesta de sí o no
import 'package:yes_no_app/domain/entities/message.dart'; // Importa la entidad de mensaje

// Clase que proporciona la lógica del chat
class ChatProvider extends ChangeNotifier {
  final chatScrollController =
      ScrollController(); // Controlador de desplazamiento del chat
  final getYesNoAnswer =
      GetYesNoAnswer(); // Instancia del helper para obtener respuestas de sí o no

  List<Message> messageList = [
    // Lista de mensajes
    Message(text: 'Hola amor', fromWho: FromWho.me), // Mensaje inicial
    Message(
        text: 'Ya regresaste del trabajo?',
        fromWho: FromWho.me), // Mensaje inicial
  ];

  // Método para enviar un mensaje
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return; // Si el texto está vacío, no se hace nada
    final newMessage = Message(
        text: text, fromWho: FromWho.me); // Crea un nuevo mensaje propio
    messageList.add(newMessage); // Agrega el nuevo mensaje a la lista
    if (text.endsWith('?')) {
      // Si el mensaje termina con un signo de interrogación
      herReply(); // Responder al mensaje
    }
    notifyListeners(); // Notifica a los escuchadores que se han realizado cambios en el estado
    moveScrollToBottom(); // Desplaza la vista del chat hacia abajo
  }

  // Método para responder a un mensaje
  Future<void> herReply() async {
    final herMessage =
        await getYesNoAnswer.getAnswer(); // Obtiene una respuesta de sí o no
    messageList.add(herMessage); // Agrega la respuesta a la lista de mensajes
    notifyListeners(); // Notifica a los escuchadores que se han realizado cambios en el estado
    moveScrollToBottom(); // Desplaza la vista del chat hacia abajo
  }

  // Método para desplazar la vista del chat hacia abajo
  void moveScrollToBottom() async {
    await Future.delayed(
        const Duration(milliseconds: 100)); // Espera un breve momento
    chatScrollController.animateTo(
        // Realiza una animación para desplazar la vista
        chatScrollController
            .position.maxScrollExtent, // Hacia el final del contenido
        duration: const Duration(milliseconds: 300), // Duración de la animación
        curve: Curves.easeIn); // Curva de la animación
  }
}