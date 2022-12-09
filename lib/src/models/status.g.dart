// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      id: json['id'] as String,
      uri: json['uri'] as String,
      url: json['url'] == null ? null : Uri.parse(json['url'] as String),
      account: Account.fromJson(json['account'] as Map<String, dynamic>),
      inReplyToId: json['in_reply_to_id'] as String?,
      inReplyToAccountId: json['in_reply_to_account_id'] as String?,
      reblog: json['reblog'] == null
          ? null
          : Status.fromJson(json['reblog'] as Map<String, dynamic>),
      content: json['content'] as String,
      text: json['text'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      emojis: (json['emojis'] as List<dynamic>)
          .map((e) => Emoji.fromJson(e as Map<String, dynamic>))
          .toList(),
      repliesCount: json['replies_count'] as int,
      reblogsCount: json['reblogs_count'] as int,
      favouritesCount: json['favourites_count'] as int,
      reblogged: json['reblogged'] as bool? ?? false,
      favourited: json['favourited'] as bool? ?? false,
      muted: json['muted'] as bool? ?? false,
      bookmarked: json['bookmarked'] as bool,
      sensitive: json['sensitive'] as bool,
      spoilerText: json['spoiler_text'] as String,
      visibility: $enumDecode(_$VisibilityEnumMap, json['visibility']),
      mediaAttachments: (json['media_attachments'] as List<dynamic>)
          .map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      mentions: (json['mentions'] as List<dynamic>)
          .map((e) => Mention.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      application: json['application'] == null
          ? null
          : Application.fromJson(json['application'] as Map<String, dynamic>),
      language: json['language'],
      pinned: json['pinned'] as bool? ?? false,
      poll: json['poll'] == null
          ? null
          : Poll.fromJson(json['poll'] as Map<String, dynamic>),
    );

const _$VisibilityEnumMap = {
  Visibility.public: 'public',
  Visibility.unlisted: 'unlisted',
  Visibility.private: 'private',
  Visibility.direct: 'direct',
};
