// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return Activity(
    week: DateTime.parse(json['week'] as String),
    statuses: json['statuses'] as int,
    logins: json['logins'] as int,
    registrations: json['registrations'] as int,
  );
}
