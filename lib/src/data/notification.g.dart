// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
      id: json['id'] as String,
      type: _$enumDecode(_$NotificationTypeEnumMap, json['type']),
      createdAt: DateTime.parse(json['created_at'] as String),
      account: Account.fromJson(json['account'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>));
}

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

const _$NotificationTypeEnumMap = <NotificationType, dynamic>{
  NotificationType.follow: 'follow',
  NotificationType.mention: 'mention',
  NotificationType.reblog: 'reblog',
  NotificationType.favourite: 'favourite'
};
