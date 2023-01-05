// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Emoji _$EmojiFromJson(Map<String, dynamic> json) => Emoji(
      shortcode: json['shortcode'] as String,
      staticUrl: Uri.parse(json['static_url'] as String),
      url: Uri.parse(json['url'] as String),
      visibleInPicker: json['visible_in_picker'] as bool,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$EmojiToJson(Emoji instance) => <String, dynamic>{
      'shortcode': instance.shortcode,
      'url': instance.url.toString(),
      'static_url': instance.staticUrl.toString(),
      'visible_in_picker': instance.visibleInPicker,
      'category': instance.category,
    };
