import 'dart:convert';

import '../../Domain/Entities/qaria.dart';

class QariaModel extends Qaria {
  const QariaModel({
    required super.url,
    required super.id,
    required super.name,
    required super.native,
    required super.slug,
  });

  factory QariaModel.fromMap(Map<String, dynamic> data) => QariaModel(
        url: data['url'] as String,
        id: data['id'] as int,
        name: data['name'] as String,
        native: data['native'] as String,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [QariaModel].
  factory QariaModel.fromJson(String data) {
    return QariaModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
