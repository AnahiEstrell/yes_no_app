// Importaciones necesarias
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importa el paquete Provider para el manejo de estado
import 'package:yes_no_app/domain/entities/message.dart'; // Importa la entidad Message
import 'package:yes_no_app/presentation/providers/chat_provider.dart'; // Importa el proveedor ChatProvider
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart'; // Importa el widget HerMessageBubble
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart'; // Importa el widget MyMessageBubble
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart'; // Importa el widget MessageFieldBox

// Pantalla principal del chat
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Barra de aplicación
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            // Avatar de usuario
            backgroundImage: NetworkImage(
                'https://images.vexels.com/media/users/3/151934/isolated/lists/9aa6fa876917b538540c5ea36f23c8e7-dibujos-animados-de-animales-de-conejo.png'),
          ),
        ),
        title: const Text('Anahí Estrella'), // Título del chat
      ),
      body: _ChatView(), // Cuerpo de la pantalla del chat
    );
  }
}

// Vista interna del chat
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>(); // Obtiene el ChatProvider del contexto

    return SafeArea(
      // Widget SafeArea para evitar el área del notch
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              // Espacio expandido para la lista de mensajes
              child: ListView.builder(
                controller: chatProvider.chatScrollController, // Controlador de desplazamiento
                itemCount: chatProvider.messageList.length, // Número de mensajes en la lista
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index]; // Mensaje en la posición actual
                  return (message.fromWho == FromWho.hers
                      ? HerMessageBubble(message: message) // Burbuja de mensaje de ella
                      : MyMessageBubble(message: message)); // Burbuja de mensaje de mí
                },
              ),
            ),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value), // Caja de campo de mensaje
            ),
          ],
        ),
      ),
    );
  }
}
