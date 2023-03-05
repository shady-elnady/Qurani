import 'dart:convert';

import '../../Domain/Entities/sora.dart';

class SoraModel extends Sora {
  const SoraModel({
    required super.url,
    required super.soraid,
    required super.name,
    required super.native,
    required super.place,
    super.noOfVerses,
    required super.slug,
  });

  factory SoraModel.fromMap(Map<String, dynamic> data) => SoraModel(
        url: data['url'] as String,
        soraid: data['soraid'] as int,
        name: data['name'] as String,
        native: data['native'] as String,
        place: data['place'] as String,
        noOfVerses: data['noOfVerses'] as int?,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SoraModel].
  factory SoraModel.fromJson(String data) {
    return SoraModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
