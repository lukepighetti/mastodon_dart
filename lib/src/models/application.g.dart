// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) => Application(
      name: json['name'] as String,
      website:
          json['website'] == null ? null : Uri.parse(json['website'] as String),
    );

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'name': instance.name,
      'website': instance.website?.toString(),
    };

AuthenticatedApplication _$AuthenticatedApplicationFromJson(
        Map<String, dynamic> json) =>
    AuthenticatedApplication(
      name: json['name'] as String,
      website:
          json['website'] == null ? null : Uri.parse(json['website'] as String),
      clientId: json['client_id'] as String,
      clientSecret: json['client_secret'] as String,
      vapidKey: json['vapid_key'] as String,
    );

Map<String, dynamic> _$AuthenticatedApplicationToJson(
        AuthenticatedApplication instance) =>
    <String, dynamic>{
      'name': instance.name,
      'website': instance.website?.toString(),
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
      'vapid_key': instance.vapidKey,
    };
