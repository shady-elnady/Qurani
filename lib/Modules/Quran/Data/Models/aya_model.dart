import 'dart:convert';

import '../../Domain/Entities/aya.dart';

class AyaModel extends Aya {
  const AyaModel({
    required super.url,
    required super.id,
    required super.soraid,
    required super.ayaid,
    required super.page,
    required super.quarter,
    required super.hezb,
    required super.joza,
    required super.sajda,
    required super.text,
    required super.uthmanitext,
    required super.searchtext,
    required super.quarterstart,
    required super.slug,
  });

  factory AyaModel.fromMap(Map<String, dynamic> data) => AyaModel(
        url: data['url'] as String,
        id: data['id'] as int,
        soraid: data['soraid'] as String,
        ayaid: data['ayaid'] as int,
        page: data['page'] as int,
        quarter: data['quarter'] as int,
        hezb: data['hezb'] as int,
        joza: data['joza'] as int,
        sajda: data['sajda'] as bool,
        text: data['text'] as String,
        uthmanitext: data['uthmanitext'] as String,
        searchtext: data['searchtext'] as String,
        quarterstart: data['quarterstart'] as bool,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AyaModel].
  factory AyaModel.fromJson(String data) {
    return AyaModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
