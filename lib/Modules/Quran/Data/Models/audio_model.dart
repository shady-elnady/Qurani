import 'dart:convert';

import '../../Domain/Entities/audio.dart';
import 'qaria_model.dart';

class AudioModel extends Audio {
  const AudioModel({
    required super.url,
    required super.id,
    required super.qaria,
    super.type,
    required super.audioUrl,
    required super.slug,
  });

  factory AudioModel.fromMap(Map<String, dynamic> data) => AudioModel(
        url: data['url'] as String,
        id: data['id'] as int,
        qaria: QariaModel.fromMap(data['qaria'] as Map<String, dynamic>),
        type: data['type'] as String?,
        audioUrl: data['audio_url'] as String,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AudioModel].
  factory AudioModel.fromJson(String data) {
    return AudioModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
