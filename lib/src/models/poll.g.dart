// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poll _$PollFromJson(Map<String, dynamic> json) => Poll(
      id: json['id'] as String,
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      expired: json['expired'] as bool,
      multiple: json['multiple'] as bool,
      votesCount: json['votes_count'] as int,
      votersCount: json['voters_count'] as int?,
      voted: json['voted'] as bool?,
      ownVotes:
          (json['own_votes'] as List<dynamic>?)?.map((e) => e as int).toList(),
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      emojis: (json['emojis'] as List<dynamic>)
          .map((e) => Emoji.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PollToJson(Poll instance) => <String, dynamic>{
      'id': instance.id,
      'expires_at': instance.expiresAt?.toIso8601String(),
      'expired': instance.expired,
      'multiple': instance.multiple,
      'votes_count': instance.votesCount,
      'voters_count': instance.votersCount,
      'voted': instance.voted,
      'own_votes': instance.ownVotes,
      'options': instance.options,
      'emojis': instance.emojis,
    };
