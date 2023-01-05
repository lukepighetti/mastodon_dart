// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushSubscription _$PushSubscriptionFromJson(Map<String, dynamic> json) =>
    PushSubscription(
      id: json['id'] as String,
      endpoint: Uri.parse(json['endpoint'] as String),
      serverKey: json['server_key'] as String,
      alerts: json['alerts'],
    );

Map<String, dynamic> _$PushSubscriptionToJson(PushSubscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'endpoint': instance.endpoint.toString(),
      'server_key': instance.serverKey,
      'alerts': instance.alerts,
    };
