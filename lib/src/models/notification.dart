import 'package:json_annotation/json_annotation.dart';
import 'account.dart';
import 'status.dart';

part 'notification.g.dart';

/// Represents a notification of an event relevant to the user.
/// https://docs.joinmastodon.org/entities/notification/

@JsonSerializable()
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
/// - mention = Someone mentioned you in their status
/// - status = Someone you enabled notifications for has posted a status
/// - reblog = Someone boosted one of your statuses
/// - follow = Someone followed you
/// - follow_request = Someone requested to follow you
/// - favourite = Someone favourited one of your statuses
/// - poll = A poll you have voted in or created has ended
/// - update = A status you boosted with has been edited
/// - admin.sign_up = Someone signed up (optionally sent to admins)
/// - admin.report = A new report has been filed
@JsonEnum(
  fieldRename: FieldRename.snake,
)
enum NotificationType {
  mention,
  status,
  reblog,
  follow,
  followRequest,
  favourite,
  poll,
  update,
  @JsonValue('admin.sign_up')
  adminSignUp,
  @JsonValue('admin.report')
  adminReport,
}
