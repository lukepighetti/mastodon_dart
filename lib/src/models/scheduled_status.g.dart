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

const _$VisibilityEnumMap = {
  Visibility.public: 'public',
  Visibility.unlisted: 'unlisted',
  Visibility.private: 'private',
  Visibility.direct: 'direct',
};
