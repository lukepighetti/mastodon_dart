// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mention.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mention _$MentionFromJson(Map<String, dynamic> json) => Mention(
      url: Uri.parse(json['url'] as String),
      username: json['username'] as String,
      acct: json['acct'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$MentionToJson(Mention instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'acct': instance.acct,
      'url': instance.url.toString(),
    };
