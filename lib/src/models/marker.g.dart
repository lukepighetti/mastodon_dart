// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Marker _$MarkerFromJson(Map<String, dynamic> json) => Marker(
      home: json['home'] == null
          ? null
          : Position.fromJson(json['home'] as Map<String, dynamic>),
      notifications: json['notifications'] == null
          ? null
          : Position.fromJson(json['notifications'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarkerToJson(Marker instance) => <String, dynamic>{
      'home': instance.home,
      'notifications': instance.notifications,
    };

Position _$PositionFromJson(Map<String, dynamic> json) => Position(
      lastReadId: json['last_read_id'] as String?,
      version: json['version'] as int?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$PositionToJson(Position instance) => <String, dynamic>{
      'last_read_id': instance.lastReadId,
      'updated_at': instance.updatedAt,
      'version': instance.version,
    };