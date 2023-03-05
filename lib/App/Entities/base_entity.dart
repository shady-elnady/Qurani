import 'package:equatable/equatable.dart';

abstract class BaseEntity extends Equatable {
  final String url;
  final String slug;

  const BaseEntity({
    required this.url,
    required this.slug,
  });

  @override
  String toString() {
    return 'BaseEntity(url: $url, slug: $slug)';
  }

  /// `dart:convert`
  /// Converts [BaseEntity] to a JSON string.
  String toJson();

  Map<String, dynamic> toMap();

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        url,
        slug,
      ];
}
