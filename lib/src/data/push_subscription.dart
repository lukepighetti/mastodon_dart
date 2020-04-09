import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

part 'push_subscription.g.dart';

/// Represents a subscription to the push streaming server.
/// https://docs.joinmastodon.org/entities/push-subscription/

@JsonSerializable(
  nullable: false,
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
    this.id,
    this.endpoint,
    this.serverKey,
    this.alerts,
  });

  PushSubscription.mock()
      : id = MockProperties.string,
        endpoint = MockProperties.uri,
        alerts = MockProperties.randomMap({}),
        serverKey = MockProperties.string;

  factory PushSubscription.fromJson(Map<String, dynamic> json) =>
      _$PushSubscriptionFromJson(json);
}
