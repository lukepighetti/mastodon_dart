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
      previewUrl: Uri.parse(json['preview_url'] as String),
      textUrl: json['text_url'] == null
          ? null
          : Uri.parse(json['text_url'] as String),
      meta: json['meta'],
      description: json['description'] as String?,
      blurhash: json['blurhash'] as String?,
    );

const _$AttachmentTypeEnumMap = {
  AttachmentType.unknown: 'unknown',
  AttachmentType.image: 'image',
  AttachmentType.gifv: 'gifv',
  AttachmentType.video: 'video',
  AttachmentType.audio: 'audio',
};
