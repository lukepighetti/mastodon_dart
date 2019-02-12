import 'package:json_annotation/json_annotation.dart';

import 'attachment.dart';
import 'shared/visibility.dart';

part 'scheduled_status.g.dart';

/// https://docs.joinmastodon.org/api/entities/#scheduledstatus

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class ScheduledStatus {
  final String id;
  final DateTime scheduledAt;
  final List<ScheduledStatusParams> params;
  final List<Attachment> mediaAttachments;

  ScheduledStatus({
    this.id,
    this.scheduledAt,
    this.params,
    this.mediaAttachments,
  });

  factory ScheduledStatus.fromJson(Map<String, dynamic> json) =>
      _$ScheduledStatusFromJson(json);
}

/// https://docs.joinmastodon.org/api/entities/#statusparams

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class ScheduledStatusParams {
  final String text;
  final String inReplyToId;
  final List<String> mediaIds;
  final bool sensitive;
  final bool spoilerText;
  final Visibility visibility;
  final DateTime scheduledAt;
  final String applicationId;

  ScheduledStatusParams({
    this.text,
    this.inReplyToId,
    this.mediaIds,
    this.sensitive,
    this.spoilerText,
    this.visibility,
    this.scheduledAt,
    this.applicationId,
  });

  factory ScheduledStatusParams.fromJson(Map<String, dynamic> json) =>
      _$ScheduledStatusParamsFromJson(json);
}
