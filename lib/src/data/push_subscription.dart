import 'package:json_annotation/json_annotation.dart';

part 'push_subscription.g.dart';

/// https://docs.joinmastodon.org/api/entities/#push-subscription

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class PushSubscription {
  final String id;
  final Uri endpoint;
  final String serverKey;
  final dynamic alerts;

  PushSubscription({
    this.id,
    this.endpoint,
    this.serverKey,
    this.alerts,
  });

  factory PushSubscription.fromJson(Map<String, dynamic> json) =>
      _$PushSubscriptionFromJson(json);
}
