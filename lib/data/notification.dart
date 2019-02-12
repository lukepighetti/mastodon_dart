import 'package:json_annotation/json_annotation.dart';

import 'account.dart';
import 'status.dart';

part 'notification.g.dart';

/// https://docs.joinmastodon.org/api/entities/#notification

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Notification {
  final String id;
  final NotificationType type;
  final DateTime createdAt;
  final Account account;

  @JsonKey(nullable: true)
  final Status status;

  Notification({
    this.id,
    this.type,
    this.createdAt,
    this.account,
    this.status,
  });

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}

enum NotificationType { follow, mention, reblog, favourite }
