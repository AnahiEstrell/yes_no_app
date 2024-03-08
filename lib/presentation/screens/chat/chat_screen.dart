import 'package:flutter/material.dart'; // Importa el paquete Flutter
import 'package:provider/provider.dart'; // Importa el paquete Provider para el manejo de estado
import 'package:yes_no_app/domain/entities/message.dart'; // Importa la entidad Message
import 'package:yes_no_app/presentation/providers/chat_provider.dart'; // Importa el proveedor ChatProvider
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart'; // Importa el widget HerMessageBubble
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart'; // Importa el widget MyMessageBubble
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart'; // Importa el widget MessageFieldBox

// Pantalla principal del chat
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    // Construye la interfaz de usuario de la pantalla
    return Scaffold(
      appBar: AppBar(
        // Barra de aplicación
        leading: const Padding(
          padding: EdgeInsets.all(
              4.0), // Espaciado alrededor de la imagen del avatar
          child: CircleAvatar(
            // Avatar del usuario
            backgroundImage: NetworkImage(
                'https://images.vexels.com/media/users/3/151934/isolated/lists/9aa6fa876917b538540c5ea36f23c8e7-dibujos-animados-de-animales-de-conejo.png'), // Imagen de avatar
          ),
        ),
        title: const Text('Anahí Estrella'), // Título de la pantalla
      ),
      body: _ChatView(), // Cuerpo de la pantalla
    );
  }
}

// Vista interna del chat
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<
        ChatProvider>(); // Obtiene el proveedor ChatProvider del contexto

    // Retorna un área segura con mensajes y un campo de entrada de texto
    return SafeArea(
      // Widget SafeArea para evitar el área del notch
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 10), // Espaciado horizontal
        child: Column(
          children: [
            Expanded(
              // Lista de mensajes
              child: ListView.builder(
                controller: chatProvider
                    .chatScrollController, // Controlador de desplazamiento de la lista
                itemCount:
                    chatProvider.messageList.length, // Número total de mensajes
                itemBuilder: (context, index) {
                  final message =
                      chatProvider.messageList[index]; // Mensaje actual
                  return (message.fromWho == FromWho.hers
                      ? HerMessageBubble(
                          message: message) // Burbuja de mensaje de ella
                      : MyMessageBubble(
                          message: message)); // Burbuja de mensaje propio
                },
              ),
            ),
            MessageFieldBox(
              onValue: (value) =>
                  chatProvider.sendMessage(value), // Campo de entrada de texto
            ),
          ],
        ),
      ),
    );
  }
}
