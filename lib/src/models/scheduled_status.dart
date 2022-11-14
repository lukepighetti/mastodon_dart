import 'package:json_annotation/json_annotation.dart';

import 'attachment.dart';
import 'visibility.dart';

part 'scheduled_status.g.dart';

/// Represents a status that will be published at a future scheduled date.
/// https://docs.joinmastodon.org/entities/scheduledstatus/

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class ScheduledStatus {
  final String id;
  final DateTime scheduledAt;
  final List<Params> params;
  final List<Attachment> mediaAttachments;

  ScheduledStatus({
    required this.id,
    required this.scheduledAt,
    required this.params,
    required this.mediaAttachments,
  });

  factory ScheduledStatus.fromJson(Map<String, dynamic> json) =>
      _$ScheduledStatusFromJson(json);
}

/// https://docs.joinmastodon.org/api/entities/#statusparams

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Params {
  final String text;
  final String inReplyToId;
  final List<String> mediaIds;
  final bool sensitive;
  final bool spoilerText;
  final Visibility visibility;
  final DateTime scheduledAt;
  final String applicationId;

  Params({
    required this.text,
    required this.inReplyToId,
    required this.mediaIds,
    required this.sensitive,
    required this.spoilerText,
    required this.visibility,
    required this.scheduledAt,
    required this.applicationId,
  });

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}
