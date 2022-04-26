import 'package:json_annotation/json_annotation.dart';

part 'push_subscription.g.dart';

/// Represents a subscription to the push streaming server.
/// https://docs.joinmastodon.org/entities/push-subscription/

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class PushSubscription {
  /// The id of the push subscription in the database
  final String id;

  /// Where push alerts will be sent to
  final Uri endpoint;

  /// The streaming server's VAPID key
  final String serverKey;

  /// Which alerts should be delivered to the [endpoint]
  final dynamic alerts;

  PushSubscription({
    required this.id,
    required this.endpoint,
    required this.serverKey,
    required this.alerts,
  });

  factory PushSubscription.fromJson(Map<String, dynamic> json) =>
      _$PushSubscriptionFromJson(json);
}
