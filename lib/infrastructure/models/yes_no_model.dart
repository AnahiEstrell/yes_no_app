// Importación de la clase Message del paquete yes_no_app/domain/entities/message.dart
import 'package:yes_no_app/domain/entities/message.dart';

// Clase para representar un modelo de respuesta de sí o no
class YesNoModel {
  String answer; // Respuesta (yes o no)
  bool forced; // Indicador de si la respuesta fue forzada
  String image; // URL de la imagen asociada a la respuesta

  // Constructor de la clase YesNoModel
  YesNoModel({
    required this.answer, // Parámetro obligatorio: respuesta
    required this.forced, // Parámetro obligatorio: indicador de respuesta forzada
    required this.image, // Parámetro obligatorio: URL de la imagen
  });

  // Método para crear una instancia de YesNoModel a partir de un mapa JSON
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json[
            "answer"], // Asigna el valor del campo "answer" del JSON a la propiedad "answer"
        forced: json[
            "forced"], // Asigna el valor del campo "forced" del JSON a la propiedad "forced"
        image: json[
            "image"], // Asigna el valor del campo "image" del JSON a la propiedad "image"
      );

  // Método para convertir el modelo a un mapa JSON
  Map<String, dynamic> toJson() => {
        "answer":
            answer, // Agrega el valor de la propiedad "answer" al mapa JSON con la clave "answer"
        "forced":
            forced, // Agrega el valor de la propiedad "forced" al mapa JSON con la clave "forced"
        "image":
            image, // Agrega el valor de la propiedad "image" al mapa JSON con la clave "image"
      };

  // Método para convertir el modelo a una entidad de mensaje
  // ignore: non_constant_identifier_names
  Message ToMessageEntity() => Message(
      text: answer == 'yes'
          ? 'Si'
          : 'No', // Texto del mensaje: "Si" si la respuesta es "yes", "No" de lo contrario
      fromWho: FromWho.hers, // Indica que el mensaje proviene de "ella"
      imageUrl: image); // URL de la imagen asociada al mensaje
}
