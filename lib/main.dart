import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

// Función principal que ejecuta la aplicación
void main() => runApp(const MyApp());

// Clase principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor de la clase MyApp

  @override
  Widget build(BuildContext context) {
    // Método build que construye la interfaz de usuario de la aplicación
    return MultiProvider(
      // Utilizamos MultiProvider para tener múltiples proveedores de estado
      providers: [
        // Aquí proporcionamos un ChangeNotifierProvider que crea una instancia de ChatProvider
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        // Widget MaterialApp que representa la aplicación
        title: 'Yes no app ', // Título de la aplicación
        debugShowCheckedModeBanner: false, // Desactiva el banner de modo de depuración
        theme: AppTheme(selectedColor: 4).theme(), // Configura el tema de la aplicación
        home: const ChatScreen(), // Establece la pantalla inicial de la aplicación
      ),
    );
  }
}

