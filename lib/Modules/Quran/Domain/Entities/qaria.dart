import 'dart:convert';

import '../../../../App/Entities/base_entity.dart';

class Qaria extends BaseEntity {
  final int id;
  final String name;
  final String native;

  const Qaria({
    required super.url,
    required this.id,
    required this.name,
    required this.native,
    required super.slug,
  });

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'id': id,
        'name': name,
        'native': native,
        'slug': slug,
      };

  ///
  /// Converts [Qaria] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  Qaria copyWith({
    required String url,
    required int id,
    required String name,
    required String native,
    required String slug,
  }) {
    return Qaria(
      url: this.url,
      id: this.id,
      name: this.name,
      native: this.native,
      slug: this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        url,
        id,
        name,
        native,
        slug,
      ];
}
