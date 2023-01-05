// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      url: Uri.parse(json['url'] as String),
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] == null ? null : Uri.parse(json['image'] as String),
      type: $enumDecode(_$CardTypeEnumMap, json['type']),
      authorName: json['author_name'] as String?,
      authorUrl: Card._safeUriParse(json['author_url'] as String),
      providerName: json['provider_name'] as String?,
      providerUrl: json['provider_url'] == null
          ? null
          : Uri.parse(json['provider_url'] as String),
      html: json['html'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      embedUrl: Uri.parse(json['embed_url'] as String),
      blurhash: json['blurhash'] as String?,
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'url': instance.url.toString(),
      'title': instance.title,
      'description': instance.description,
      'type': _$CardTypeEnumMap[instance.type]!,
      'author_name': instance.authorName,
      'author_url': instance.authorUrl?.toString(),
      'provider_name': instance.providerName,
      'provider_url': instance.providerUrl?.toString(),
      'html': instance.html,
      'width': instance.width,
      'height': instance.height,
      'image': instance.image?.toString(),
      'embed_url': instance.embedUrl.toString(),
      'blurhash': instance.blurhash,
    };

const _$CardTypeEnumMap = {
  CardType.link: 'link',
  CardType.photo: 'photo',
  CardType.video: 'video',
  CardType.rich: 'rich',
};
