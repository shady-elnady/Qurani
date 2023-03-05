import 'dart:convert';

import '../../../../App/Entities/base_entity.dart';

class Aya extends BaseEntity {
  final int id;
  final String soraid;
  final int ayaid;
  final int page;
  final int quarter;
  final int hezb;
  final int joza;
  final bool sajda;
  final String text;
  final String uthmanitext;
  final String searchtext;
  final bool quarterstart;

  const Aya({
    required super.url,
    required this.id,
    required this.soraid,
    required this.ayaid,
    required this.page,
    required this.quarter,
    required this.hezb,
    required this.joza,
    required this.sajda,
    required this.text,
    required this.uthmanitext,
    required this.searchtext,
    required this.quarterstart,
    required super.slug,
  });

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'id': id,
        'soraid': soraid,
        'ayaid': ayaid,
        'page': page,
        'quarter': quarter,
        'hezb': hezb,
        'joza': joza,
        'sajda': sajda,
        'text': text,
        'uthmanitext': uthmanitext,
        'searchtext': searchtext,
        'quarterstart': quarterstart,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [Aya] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  Aya copyWith({
    required String url,
    required int id,
    required String soraid,
    required int ayaid,
    required int page,
    required int quarter,
    required int hezb,
    required int joza,
    required bool sajda,
    required String text,
    required String uthmanitext,
    required String searchtext,
    required bool quarterstart,
    required String slug,
  }) {
    return Aya(
      url: this.url,
      id: this.id,
      soraid: this.soraid,
      ayaid: this.ayaid,
      page: this.page,
      quarter: this.quarter,
      hezb: this.hezb,
      joza: this.joza,
      sajda: this.sajda,
      text: this.text,
      uthmanitext: this.uthmanitext,
      searchtext: this.searchtext,
      quarterstart: this.quarterstart,
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
      soraid,
      ayaid,
      page,
      quarter,
      hezb,
      joza,
      sajda,
      text,
      uthmanitext,
      searchtext,
      quarterstart,
      slug,
    ];
  }
}
