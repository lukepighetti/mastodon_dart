// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poll _$PollFromJson(Map<String, dynamic> json) {
  return Poll(
    id: json['id'] as String,
    expiresAt: json['expires_at'] == null
        ? null
        : DateTime.parse(json['expires_at'] as String),
    expired: json['expired'] as bool,
    multiple: json['multiple'] as bool,
    votes_count: json['votes_count'] as int,
    voters_count: json['voters_count'] as int,
    voted: json['voted'] as bool,
    own_votes: (json['own_votes'] as List)?.map((e) => e as int)?.toList(),
    options: (json['options'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as int),
    ),
    emojis: (json['emojis'] as List)
        .map((e) => Emoji.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
