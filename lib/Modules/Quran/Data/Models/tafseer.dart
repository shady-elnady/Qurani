import 'dart:convert';

import '../../Domain/Entities/tafseer.dart';

class TafseerModel extends Tafseer {
  const TafseerModel({
    required super.url,
    required super.serialNo,
    required super.id,
    required super.title,
    super.info,
    super.type,
    required super.isDownload,
    required super.slug,
  });

  factory TafseerModel.fromMap(Map<String, dynamic> data) => TafseerModel(
        url: data['url'] as String,
        serialNo: data['serial_no'] as int,
        id: data['id'] as int,
        title: data['title'] as String,
        info: data['info'] as String?,
        type: data['type'] as String?,
        isDownload: data['is_download'] as bool,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TafseerModel].
  factory TafseerModel.fromJson(String data) {
    return TafseerModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
