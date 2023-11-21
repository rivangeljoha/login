import 'dart:convert';

class AreaModel {
  AreaModel({
    required this.id,
    required this.nombreArea,
    required this.codigo,
  });

  int id;
  String nombreArea;
  int codigo;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombreArea': nombreArea,
      'codigo': codigo,
    };
  }
}
