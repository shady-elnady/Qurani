import 'dart:convert';

import '../../../../App/Entities/base_entity.dart';

class Sora extends BaseEntity {
  final int soraid;
  final String name;
  final String native;
  final String place;
  final int? noOfVerses;

  const Sora({
    required super.url,
    required this.soraid,
    required this.name,
    required this.native,
    required this.place,
    this.noOfVerses,
    required super.slug,
  });

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'soraid': soraid,
        'name': name,
        'native': native,
        'place': place,
        'noOfVerses': noOfVerses,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [Sora] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  Sora copyWith({
    required String url,
    required int soraid,
    required String name,
    required String native,
    required String place,
    int? noOfVerses,
    required String slug,
  }) {
    return Sora(
      url: this.url,
      soraid: this.soraid,
      name: this.name,
      native: this.native,
      place: this.place,
      noOfVerses: noOfVerses ?? this.noOfVerses,
      slug: this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      url,
      soraid,
      name,
      native,
      place,
      noOfVerses,
      slug,
    ];
  }
}
