// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Instance _$InstanceFromJson(Map<String, dynamic> json) {
  return Instance(
    uri: Uri.parse(json['uri'] as String),
    title: json['title'] as String,
    description: json['description'] as String,
    email: json['email'] as String,
    version: json['version'] as String,
    thumbnail: json['thumbnail'] == null
        ? null
        : Uri.parse(json['thumbnail'] as String),
    urls: json['urls'],
    stats: InstanceStats.fromJson(json['stats'] as Map<String, dynamic>),
    languages: json['languages'],
    contactAccount: json['contact_account'] == null
        ? null
        : Account.fromJson(json['contact_account'] as Map<String, dynamic>),
    shortDescription: json['short_description'] as String,
    registrations: json['registrations'] as bool,
    contact_required: json['contact_required'] as bool,
  );
}

InstanceStats _$InstanceStatsFromJson(Map<String, dynamic> json) {
  return InstanceStats(
    userCount: json['user_count'] as int,
    statusCount: json['status_count'] as int,
    domainCount: json['domain_count'] as int,
  );
}
