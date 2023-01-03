// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Instance _$InstanceFromJson(Map<String, dynamic> json) => Instance(
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
      approvalRequired: json['approval_required'] as bool,
    );

Map<String, dynamic> _$InstanceToJson(Instance instance) => <String, dynamic>{
      'uri': instance.uri.toString(),
      'title': instance.title,
      'description': instance.description,
      'short_description': instance.shortDescription,
      'email': instance.email,
      'version': instance.version,
      'languages': instance.languages,
      'registrations': instance.registrations,
      'approval_required': instance.approvalRequired,
      'urls': instance.urls,
      'stats': instance.stats,
      'thumbnail': instance.thumbnail?.toString(),
      'contact_account': instance.contactAccount,
    };

InstanceStats _$InstanceStatsFromJson(Map<String, dynamic> json) =>
    InstanceStats(
      userCount: json['user_count'] as int,
      statusCount: json['status_count'] as int,
      domainCount: json['domain_count'] as int,
    );

Map<String, dynamic> _$InstanceStatsToJson(InstanceStats instance) =>
    <String, dynamic>{
      'user_count': instance.userCount,
      'status_count': instance.statusCount,
      'domain_count': instance.domainCount,
    };
