import 'dart:convert';

import '../../../../App/Entities/base_entity.dart';
import 'qaria.dart';

class Audio extends BaseEntity {
  final int id;
  final Qaria qaria;
  final String? type;
  final String audioUrl;

  const Audio({
    required super.url,
    required this.id,
    required this.qaria,
    this.type,
    required this.audioUrl,
    required super.slug,
  });

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'id': id,
        'qaria': qaria.toMap(),
        'type': type,
        'audio_url': audioUrl,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [Audio] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  Audio copyWith({
    required String url,
    required int id,
    required Qaria qaria,
    String? type,
    required String audioUrl,
    required String slug,
  }) {
    return Audio(
      url: this.url,
      id: this.id,
      qaria: this.qaria,
      type: type ?? this.type,
      audioUrl: this.audioUrl,
      slug: this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        url,
        id,
        qaria,
        type,
        audioUrl,
        slug,
      ];
}
