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
  final String id;
  final Uri endpoint;
  final dynamic alerts;
  final String serverKey;

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
