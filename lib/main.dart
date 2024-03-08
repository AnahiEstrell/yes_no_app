import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

// Punto de entrada de la aplicación
void main() =>
    runApp(const MyApp()); // Función principal que ejecuta la aplicación

// Clase principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor de la clase

  @override
  Widget build(BuildContext context) {
    // Método para construir la interfaz de usuario de la aplicación
    return MultiProvider(
      // Utiliza MultiProvider para proporcionar varios proveedores de estado
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                ChatProvider()), // Proveedor de ChatProvider para el manejo del chat
      ],
      child: MaterialApp(
        // Widget MaterialApp para la configuración de la aplicación
        title: 'Yes_no_app', // Título de la aplicación
        debugShowCheckedModeBanner: false, // Desactiva el banner de depuración
        theme: AppTheme(selectedColor: 4)
            .theme(), // Configura el tema de la aplicación utilizando la clase AppTheme
        home:
            const ChatScreen(), // Establece la pantalla principal como ChatScreen
      ),
    );
  }
}
