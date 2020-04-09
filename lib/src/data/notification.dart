import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';
import 'account.dart';
import 'status.dart';

part 'notification.g.dart';

/// Represents a notification of an event relevant to the user.
/// https://docs.joinmastodon.org/entities/notification/

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

  Notification.mock()
      : id = MockProperties.string,
        type = MockProperties.randomItem([
          NotificationType.follow,
          NotificationType.mention,
          NotificationType.reblog,
          NotificationType.favourite,
        ]),
        createdAt = MockProperties.pastDate,
        account = Account.mock(),
        status = Status.mock();

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}

/// The type of event that resulted in the notification:
/// follow = Someone followed you
/// mention = Someone mentioned you in their status
/// reblog = Someone boosted one of your statuses
/// favourite = Someone favourited one of your statuses
/// poll = A poll you have voted in or created has ended
enum NotificationType { follow, mention, reblog, favourite }
