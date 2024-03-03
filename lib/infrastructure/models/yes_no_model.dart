// Importación de la clase Message del paquete yes_no_app/domain/entities/message.dart
import 'package:yes_no_app/domain/entities/message.dart';

// Clase YesNoModel que representa un modelo de datos para respuestas de "Sí" o "No"
class YesNoModel {
  String answer; // Respuesta ("yes" o "no")
  bool forced; // Indicador de si la respuesta fue forzada
  String image; // URL de una imagen relacionada con la respuesta

  // Constructor de la clase YesNoModel
  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  // Método factory para crear una instancia de YesNoModel desde un mapa JSON
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"], // Obtiene la respuesta del JSON
        forced: json["forced"], // Obtiene el indicador forzado del JSON
        image: json["image"], // Obtiene la URL de la imagen del JSON
      );

  // Método toJson para convertir el objeto YesNoModel a un mapa JSON
  Map<String, dynamic> toJson() => {
        "answer": answer, // Agrega la respuesta al mapa JSON
        "forced": forced, // Agrega el indicador forzado al mapa JSON
        "image": image, // Agrega la URL de la imagen al mapa JSON
      };

  // Método ToMessageEntity para convertir el objeto YesNoModel a un objeto Message
  // ignore: non_constant_identifier_names
  Message ToMessageEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No', // Convierte la respuesta a "Si" o "No"
      fromWho: FromWho.hers, // Define el remitente del mensaje
      imageUrl: image); // Define la URL de la imagen del mensaje
}
