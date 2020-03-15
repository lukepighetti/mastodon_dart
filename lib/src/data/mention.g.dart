// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mention.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mention _$MentionFromJson(Map<String, dynamic> json) {
  return Mention(
    url: Uri.parse(json['url'] as String),
    username: json['username'] as String,
    acct: json['acct'] as String,
    id: json['id'] as String,
  );
}
