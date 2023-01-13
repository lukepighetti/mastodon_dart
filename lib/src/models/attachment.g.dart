// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
      id: json['id'] as String,
      type: $enumDecode(_$AttachmentTypeEnumMap, json['type']),
      url: Uri.parse(json['url'] as String),
      remoteUrl: json['remote_url'] == null
          ? null
          : Uri.parse(json['remote_url'] as String),
      previewUrl: json['preview_url'] == null
          ? null
          : Uri.parse(json['preview_url'] as String),
      textUrl: json['text_url'] == null
          ? null
          : Uri.parse(json['text_url'] as String),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      description: json['description'] as String?,
      blurhash: json['blurhash'] as String?,
    );

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$AttachmentTypeEnumMap[instance.type]!,
      'url': instance.url.toString(),
      'preview_url': instance.previewUrl?.toString(),
      'remote_url': instance.remoteUrl?.toString(),
      'text_url': instance.textUrl?.toString(),
      'meta': instance.meta,
      'description': instance.description,
      'blurhash': instance.blurhash,
    };

const _$AttachmentTypeEnumMap = {
  AttachmentType.unknown: 'unknown',
  AttachmentType.image: 'image',
  AttachmentType.gifv: 'gifv',
  AttachmentType.video: 'video',
  AttachmentType.audio: 'audio',
};
