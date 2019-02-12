// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
      name: json['name'] as String,
      website: Uri.parse(json['website'] as String),
      history: (json['history'] as List)
          ?.map((e) =>
              e == null ? null : History.fromJson(e as Map<String, dynamic>))
          ?.toList());
}
