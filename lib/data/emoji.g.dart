// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Emoji _$EmojiFromJson(Map<String, dynamic> json) {
  return Emoji(
      shortcode: json['shortcode'] as String,
      staticUrl: Uri.parse(json['static_url'] as String),
      url: Uri.parse(json['url'] as String),
      visibleInPicker: json['visible_in_picker'] as bool);
}
