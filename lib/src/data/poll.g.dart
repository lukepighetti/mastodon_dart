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
      votersCount: json['voters_count'] as int,
      voted: json['voted'] as bool?,
      ownVotes:
          (json['own_votes'] as List<dynamic>?)?.map((e) => e as int).toList(),
      options: json['options'],
      emojis: (json['emojis'] as List<dynamic>)
          .map((e) => Emoji.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
