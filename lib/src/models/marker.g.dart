// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Markers _$MarkersFromJson(Map<String, dynamic> json) => Markers(
      home: json['home'] == null
          ? null
          : Marker.fromJson(json['home'] as Map<String, dynamic>),
      notifications: json['notifications'] == null
          ? null
          : Marker.fromJson(json['notifications'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarkersToJson(Markers instance) => <String, dynamic>{
      'home': instance.home,
      'notifications': instance.notifications,
    };

Marker _$MarkerFromJson(Map<String, dynamic> json) => Marker(
      lastReadId: json['last_read_id'] as String,
      version: json['version'] as int,
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$MarkerToJson(Marker instance) => <String, dynamic>{
      'last_read_id': instance.lastReadId,
      'updated_at': instance.updatedAt.toIso8601String(),
      'version': instance.version,
    };
