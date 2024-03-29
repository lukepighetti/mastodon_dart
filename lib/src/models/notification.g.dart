// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      id: json['id'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      createdAt: DateTime.parse(json['created_at'] as String),
      account: Account.fromJson(json['account'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'created_at': instance.createdAt.toIso8601String(),
      'account': instance.account,
      'status': instance.status,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.mention: 'mention',
  NotificationType.status: 'status',
  NotificationType.reblog: 'reblog',
  NotificationType.follow: 'follow',
  NotificationType.followRequest: 'follow_request',
  NotificationType.favourite: 'favourite',
  NotificationType.poll: 'poll',
  NotificationType.update: 'update',
  NotificationType.adminSignUp: 'admin.sign_up',
  NotificationType.adminReport: 'admin.report',
};
