import 'dart:convert';

import '../../Domain/Entities/language.dart';

class LanguageModel extends Language {
  const LanguageModel({
    required super.url,
    required super.id,
    required super.name,
    required super.native,
    required super.symbol,
    required super.rtl,
    super.emoji,
    required super.slug,
  });

  factory LanguageModel.fromMap(Map<String, dynamic> data) => LanguageModel(
        url: data['url'] as String,
        id: data['id'] as int,
        name: data['name'] as String,
        native: data['native'] as String,
        symbol: data['symbol'] as String,
        rtl: data['rtl'] as bool,
        emoji: data['emoji'] as String,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LanguageModel].
  factory LanguageModel.fromJson(String data) {
    return LanguageModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
