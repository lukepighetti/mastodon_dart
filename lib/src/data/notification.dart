import 'package:json_annotation/json_annotation.dart';
import 'account.dart';
import 'status.dart';

part 'notification.g.dart';

/// Represents a notification of an event relevant to the user.
/// https://docs.joinmastodon.org/entities/notification/

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Notification {
  /// The id of the notification in the database
  final String id;

  /// The type of event that resulted in the notification. Enumerated by [NotificationType]
  final NotificationType type;

  /// The timestamp of the notification
  final DateTime createdAt;

  /// The account that performed the action that generated the notification
  final Account account;

  /// Status that was the object of the notification, e.g. in mentions, reblogs, favourites, or polls
  final Status? status;

  Notification({
    required this.id,
    required this.type,
    required this.createdAt,
    required this.account,
    required this.status,
  });

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}

/// The type of event that resulted in the notification:
/// - follow = Someone followed you
/// - mention = Someone mentioned you in their status
/// - reblog = Someone boosted one of your statuses
/// - favourite = Someone favourited one of your statuses
/// - poll = A poll you have voted in or created has ended
enum NotificationType { follow, mention, reblog, favourite }
