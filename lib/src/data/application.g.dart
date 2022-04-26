// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) => Application(
      name: json['name'] as String,
      website:
          json['website'] == null ? null : Uri.parse(json['website'] as String),
      vapid_key: json['vapid_key'] as String,
    );

AuthenticatedApplication _$AuthenticatedApplicationFromJson(
        Map<String, dynamic> json) =>
    AuthenticatedApplication(
      name: json['name'] as String,
      website:
          json['website'] == null ? null : Uri.parse(json['website'] as String),
      vapid_key: json['vapid_key'] as String,
      clientId: json['client_id'] as String,
      clientSecret: json['client_secret'] as String,
    );
