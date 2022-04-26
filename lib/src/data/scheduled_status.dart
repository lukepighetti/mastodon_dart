import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

import 'attachment.dart';
import 'shared/visibility.dart';

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

  ScheduledStatus.mock()
      : id = MockProperties.string,
        scheduledAt = MockProperties.pastDate,
        params = MockProperties.randomSublist([
          Params.mock(),
          Params.mock(),
          Params.mock(),
          Params.mock(),
        ]),
        mediaAttachments = MockProperties.randomSublist([
          Attachment.mock(),
          Attachment.mock(),
          Attachment.mock(),
          Attachment.mock(),
        ]);

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

  Params.mock()
      : text = MockProperties.tag,
        inReplyToId = MockProperties.string,
        mediaIds = MockProperties.randomSublist([
          MockProperties.string,
          MockProperties.string,
          MockProperties.string,
        ]),
        sensitive = MockProperties.boolean,
        spoilerText = MockProperties.boolean,
        visibility = MockProperties.randomItem([
          Visibility.direct,
          Visibility.private,
          Visibility.public,
          Visibility.unlisted,
        ]),
        scheduledAt = MockProperties.pastDate,
        applicationId = MockProperties.string;

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}
