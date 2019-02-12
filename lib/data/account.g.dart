// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
      id: json['id'] as String,
      username: json['username'] as String,
      acct: json['acct'] as String,
      displayName: json['display_name'] as String,
      locked: json['locked'] as bool,
      created_at: DateTime.parse(json['created_at'] as String),
      followersCount: json['followers_count'] as int,
      followingCount: json['following_count'] as int,
      statusesCount: json['statuses_count'] as int,
      note: json['note'] as String,
      url: Uri.parse(json['url'] as String),
      avatar: Uri.parse(json['avatar'] as String),
      avatarStatic: Uri.parse(json['avatar_static'] as String),
      header: Uri.parse(json['header'] as String),
      headerStatic: Uri.parse(json['header_static'] as String),
      emojis: (json['emojis'] as List)
          .map((e) => Emoji.fromJson(e as Map<String, dynamic>))
          .toList(),
      moved: json['moved'] == null
          ? null
          : Account.fromJson(json['moved'] as Map<String, dynamic>),
      fields: json['fields'] as List,
      bot: json['bot'] as bool);
}
