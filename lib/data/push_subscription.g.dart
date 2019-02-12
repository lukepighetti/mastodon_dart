// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushSubscription _$PushSubscriptionFromJson(Map<String, dynamic> json) {
  return PushSubscription(
      id: json['id'] as String,
      endpoint: Uri.parse(json['endpoint'] as String),
      serverKey: json['server_key'] as String,
      alerts: json['alerts']);
}
