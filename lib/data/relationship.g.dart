// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Relationship _$RelationshipFromJson(Map<String, dynamic> json) {
  return Relationship(
      id: json['id'] as String,
      following: json['following'] as bool,
      followedBy: json['followed_by'] as bool,
      blocking: json['blocking'] as bool,
      muting: json['muting'] as bool,
      mutingNotifications: json['muting_notifications'] as bool,
      requested: json['requested'] as bool,
      domainBlocking: json['domain_blocking'] as bool,
      showingReblogs: json['showing_reblogs'] as bool,
      endorsed: json['endorsed'] as bool);
}
