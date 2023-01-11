// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      length: json['length'] as String?,
      duration: (json['duration'] as num?)?.toDouble(),
      fps: json['fps'] as int?,
      size: json['size'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      aspect: (json['aspect'] as num?)?.toDouble(),
      focus: json['focus'] == null
          ? null
          : Focus.fromJson(json['focus'] as Map<String, dynamic>),
      audioEncode: json['audio_encode'] as String?,
      audioBitrate: json['audio_bitrate'] as String?,
      audioChannels: json['audio_channels'] as String?,
      original: json['original'] == null
          ? null
          : Details.fromJson(json['original'] as Map<String, dynamic>),
      small: json['small'] == null
          ? null
          : Details.fromJson(json['small'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'length': instance.length,
      'duration': instance.duration,
      'fps': instance.fps,
      'size': instance.size,
      'width': instance.width,
      'height': instance.height,
      'aspect': instance.aspect,
      'focus': instance.focus,
      'audio_encode': instance.audioEncode,
      'audio_bitrate': instance.audioBitrate,
      'audio_channels': instance.audioChannels,
      'original': instance.original,
      'small': instance.small,
    };

Focus _$FocusFromJson(Map<String, dynamic> json) => Focus(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FocusToJson(Focus instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      duration: (json['duration'] as num?)?.toDouble(),
      bitrate: json['bitrate'] as int?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      size: json['size'] as String?,
      aspect: (json['aspect'] as num?)?.toDouble(),
      frameRate: json['frame_rate'] as String?,
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'duration': instance.duration,
      'bitrate': instance.bitrate,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'aspect': instance.aspect,
      'frame_rate': instance.frameRate,
    };
