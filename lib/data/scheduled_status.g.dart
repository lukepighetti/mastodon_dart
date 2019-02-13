// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduledStatus _$ScheduledStatusFromJson(Map<String, dynamic> json) {
  return ScheduledStatus(
      id: json['id'] as String,
      scheduledAt: DateTime.parse(json['scheduled_at'] as String),
      params: (json['params'] as List)
          .map((e) => Params.fromJson(e as Map<String, dynamic>))
          .toList(),
      mediaAttachments: (json['media_attachments'] as List)
          .map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList());
}

Params _$ParamsFromJson(Map<String, dynamic> json) {
  return Params(
      text: json['text'] as String,
      inReplyToId: json['in_reply_to_id'] as String,
      mediaIds: (json['media_ids'] as List).map((e) => e as String).toList(),
      sensitive: json['sensitive'] as bool,
      spoilerText: json['spoiler_text'] as bool,
      visibility: _$enumDecode(_$VisibilityEnumMap, json['visibility']),
      scheduledAt: DateTime.parse(json['scheduled_at'] as String),
      applicationId: json['application_id'] as String);
}

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

const _$VisibilityEnumMap = <Visibility, dynamic>{
  Visibility.public: 'public',
  Visibility.unlisted: 'unlisted',
  Visibility.private: 'private',
  Visibility.direct: 'direct'
};
