// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeaturedTag _$FeaturedTagFromJson(Map<String, dynamic> json) => FeaturedTag(
      id: json['id'] as String,
      name: json['name'] as String,
      statusesCount: json['statuses_count'] as int,
      lastStatusAt: DateTime.parse(json['last_status_at'] as String),
    );
