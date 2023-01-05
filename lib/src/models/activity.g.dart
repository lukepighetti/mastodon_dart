// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      week: DateTime.parse(json['week'] as String),
      statuses: json['statuses'] as int,
      logins: json['logins'] as int,
      registrations: json['registrations'] as int,
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'week': instance.week.toIso8601String(),
      'statuses': instance.statuses,
      'logins': instance.logins,
      'registrations': instance.registrations,
    };
