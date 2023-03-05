import 'dart:convert';

import '../../../../App/Entities/base_entity.dart';

class Tafseer extends BaseEntity {
  final int serialNo;
  final int id;
  final String title;
  final String? info;
  final String? type;
  final bool isDownload;

  const Tafseer({
    required super.url,
    required this.serialNo,
    required this.id,
    required this.title,
    this.info,
    this.type,
    required this.isDownload,
    required super.slug,
  });
  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'serial_no': serialNo,
        'id': id,
        'title': title,
        'info': info,
        'type': type,
        'is_download': isDownload,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [Tafseer] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  Tafseer copyWith({
    required String url,
    required int serialNo,
    required int id,
    required String title,
    String? info,
    String? type,
    required bool isDownload,
    required String slug,
  }) {
    return Tafseer(
      url: this.url,
      serialNo: this.serialNo,
      id: this.id,
      title: this.title,
      info: info ?? this.info,
      type: type ?? this.type,
      isDownload: this.isDownload,
      slug: this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      url,
      serialNo,
      id,
      title,
      info,
      type,
      isDownload,
      slug,
    ];
  }
}
