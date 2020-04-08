// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) {
  return Card(
    url: Uri.parse(json['url'] as String),
    title: json['title'] as String,
    description: json['description'] as String,
    image: json['image'] == null ? null : Uri.parse(json['image'] as String),
    type: _$enumDecode(_$CardTypeEnumMap, json['type']),
    authorName: json['author_name'] as String,
    authorUrl: json['author_url'] == null
        ? null
        : Uri.parse(json['author_url'] as String),
    providerName: json['provider_name'] as String,
    providerUrl: json['provider_url'] == null
        ? null
        : Uri.parse(json['provider_url'] as String),
    html: json['html'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    embedUrl: Uri.parse(json['embed_url'] as String),
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

const _$CardTypeEnumMap = {
  CardType.link: 'link',
  CardType.photo: 'photo',
  CardType.video: 'video',
  CardType.rich: 'rich',
};
