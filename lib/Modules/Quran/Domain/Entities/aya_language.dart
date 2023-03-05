import 'dart:convert';

import '../../../../App/Entities/base_entity.dart';
import 'aya.dart';
import 'sora.dart';

class AyaLanguage extends BaseEntity {
  final String language;
  final Sora sora;
  final Aya aya;
  final String text;

  const AyaLanguage({
    required super.url,
    required this.language,
    required this.sora,
    required this.aya,
    required this.text,
    required super.slug,
  });

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'language': language,
        'sora': sora.toMap(),
        'aya': aya.toMap(),
        'text': text,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [AyaLanguage] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  AyaLanguage copyWith({
    required String url,
    required String language,
    required Sora sora,
    required Aya aya,
    required String text,
    required String slug,
  }) {
    return AyaLanguage(
      url: this.url,
      language: this.language,
      sora: this.sora,
      aya: this.aya,
      text: this.text,
      slug: this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        url,
        language,
        sora,
        aya,
        text,
        slug,
      ];
}
