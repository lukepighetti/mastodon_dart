// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['id'] as String,
      username: json['username'] as String,
      acct: json['acct'] as String,
      displayName: json['display_name'] as String,
      locked: json['locked'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      followersCount: json['followers_count'] as int,
      followingCount: json['following_count'] as int,
      statusesCount: json['statuses_count'] as int,
      note: json['note'] as String,
      url: Uri.parse(json['url'] as String),
      avatar: Uri.parse(json['avatar'] as String),
      avatarStatic: Uri.parse(json['avatar_static'] as String),
      header: Uri.parse(json['header'] as String),
      headerStatic: Uri.parse(json['header_static'] as String),
      lastStatusAt: json['last_status_at'] == null
          ? null
          : DateTime.parse(json['last_status_at'] as String),
      emojis: (json['emojis'] as List<dynamic>)
          .map((e) => Emoji.fromJson(e as Map<String, dynamic>))
          .toList(),
      moved: json['moved'] == null
          ? null
          : Account.fromJson(json['moved'] as Map<String, dynamic>),
      suspended: json['suspended'] as bool?,
      limited: json['limited'] as bool?,
      fields: (json['fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
      bot: json['bot'] as bool,
      group: json['group'] as bool,
      discoverable: json['discoverable'] as bool?,
      noindex: json['noindex'] as bool?,
    );

Field _$FieldFromJson(Map<String, dynamic> json) => Field(
      name: json['name'] as String,
      value: json['value'] as String,
      verifiedAt: json['verified_at'] == null
          ? null
          : DateTime.parse(json['verified_at'] as String),
    );

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      privacy: json['privacy'] as String?,
      sensitive: json['sensitive'] as bool?,
      language: json['language'],
      note: json['note'] as String,
      fields: (json['fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
      followRequestsCount: json['follow_requests_count'] as int,
    );

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      scope: json['scope'] as String,
      createdAt: Token._secondsSinceEpoch(json['created_at'] as int),
    );
