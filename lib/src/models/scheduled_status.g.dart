// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduledStatus _$ScheduledStatusFromJson(Map<String, dynamic> json) =>
    ScheduledStatus(
      id: json['id'] as String,
      scheduledAt: DateTime.parse(json['scheduled_at'] as String),
      params: (json['params'] as List<dynamic>)
          .map((e) => Params.fromJson(e as Map<String, dynamic>))
          .toList(),
      mediaAttachments: (json['media_attachments'] as List<dynamic>)
          .map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScheduledStatusToJson(ScheduledStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scheduled_at': instance.scheduledAt.toIso8601String(),
      'params': instance.params,
      'media_attachments': instance.mediaAttachments,
    };

Params _$ParamsFromJson(Map<String, dynamic> json) => Params(
      text: json['text'] as String,
      inReplyToId: json['in_reply_to_id'] as String,
      mediaIds:
          (json['media_ids'] as List<dynamic>).map((e) => e as String).toList(),
      sensitive: json['sensitive'] as bool,
      spoilerText: json['spoiler_text'] as bool,
      visibility: $enumDecode(_$VisibilityEnumMap, json['visibility']),
      scheduledAt: DateTime.parse(json['scheduled_at'] as String),
      applicationId: json['application_id'] as String,
    );

Map<String, dynamic> _$ParamsToJson(Params instance) => <String, dynamic>{
      'text': instance.text,
      'in_reply_to_id': instance.inReplyToId,
      'media_ids': instance.mediaIds,
      'sensitive': instance.sensitive,
      'spoiler_text': instance.spoilerText,
      'visibility': _$VisibilityEnumMap[instance.visibility]!,
      'scheduled_at': instance.scheduledAt.toIso8601String(),
      'application_id': instance.applicationId,
    };

const _$VisibilityEnumMap = {
  Visibility.public: 'public',
  Visibility.unlisted: 'unlisted',
  Visibility.private: 'private',
  Visibility.direct: 'direct',
};
