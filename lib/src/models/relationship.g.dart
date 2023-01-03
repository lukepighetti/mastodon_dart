// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Relationship _$RelationshipFromJson(Map<String, dynamic> json) => Relationship(
      id: json['id'] as String,
      following: json['following'] as bool,
      followedBy: json['followed_by'] as bool,
      blocking: json['blocking'] as bool,
      muting: json['muting'] as bool,
      mutingNotifications: json['muting_notifications'] as bool,
      requested: json['requested'] as bool,
      domainBlocking: json['domain_blocking'] as bool,
      showingReblogs: json['showing_reblogs'] as bool,
      endorsed: json['endorsed'] as bool,
      blockedBy: json['blocked_by'] as bool,
    );

Map<String, dynamic> _$RelationshipToJson(Relationship instance) =>
    <String, dynamic>{
      'id': instance.id,
      'following': instance.following,
      'requested': instance.requested,
      'endorsed': instance.endorsed,
      'followed_by': instance.followedBy,
      'muting': instance.muting,
      'muting_notifications': instance.mutingNotifications,
      'showing_reblogs': instance.showingReblogs,
      'blocking': instance.blocking,
      'domain_blocking': instance.domainBlocking,
      'blocked_by': instance.blockedBy,
    };
