import 'dart:convert';

import '../../../../App/Entities/base_entity.dart';

class Language extends BaseEntity {
  final int id;
  final String name;
  final String native;
  final String symbol;
  final bool rtl;
  final String? emoji;

  const Language({
    required super.url,
    required this.id,
    required this.name,
    required this.native,
    required this.symbol,
    required this.rtl,
    this.emoji,
    required super.slug,
  });

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'id': id,
        'name': name,
        'native': native,
        'symbol': symbol,
        'rtl': rtl,
        'emoji': emoji,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [Language] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  Language copyWith({
    required String url,
    required int id,
    required String name,
    required String native,
    required String symbol,
    required bool rtl,
    String? emoji,
    required String slug,
  }) {
    return Language(
      url: this.url,
      id: this.id,
      name: this.name,
      native: this.native,
      symbol: this.symbol,
      rtl: this.rtl,
      emoji: emoji ?? this.emoji,
      slug: this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      url,
      id,
      name,
      native,
      symbol,
      rtl,
      emoji,
      slug,
    ];
  }
}
