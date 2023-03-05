import 'dart:convert';

import '../../Domain/Entities/aya_language.dart';
import 'aya_model.dart';
import 'sora_model.dart';

class AyaLanguageModel extends AyaLanguage {
  const AyaLanguageModel({
    required super.url,
    required super.language,
    required super.sora,
    required super.aya,
    required super.text,
    required super.slug,
  });

  factory AyaLanguageModel.fromMap(Map<String, dynamic> data) =>
      AyaLanguageModel(
        url: data['url'] as String,
        language: data['language'] as String,
        sora: SoraModel.fromMap(data['sora'] as Map<String, dynamic>),
        aya: AyaModel.fromMap(data['aya'] as Map<String, dynamic>),
        text: data['text'] as String,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AyaLanguageModel].
  factory AyaLanguageModel.fromJson(String data) {
    return AyaLanguageModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
