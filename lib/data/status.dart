import 'package:json_annotation/json_annotation.dart';

import 'account.dart';
import 'application.dart';
import 'attachment.dart';
import 'card.dart';
import 'emoji.dart';
import 'mention.dart';
import 'tag.dart';

import 'shared/visibility.dart';

part 'status.g.dart';

/// https://docs.joinmastodon.org/api/entities/#status

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Status {
  final String id;
  final String uri;

  @JsonKey(nullable: true)
  final Uri url;

  final Account account;

  @JsonKey(nullable: true)
  final String inReplyToId;

  @JsonKey(nullable: true)
  final String inReplyToAccountId;

  @JsonKey(nullable: true)
  final Status reblog;

  final String content;
  final String created_at;
  final List<Emoji> emojis;
  final int repliesCount;
  final int reblogsCount;
  final int favouritesCount;

  @JsonKey(nullable: true)
  final bool reblogged;

  @JsonKey(nullable: true)
  final bool favourited;

  @JsonKey(nullable: true)
  final bool muted;

  final bool sensitive;
  final String spoilerText;
  final Visibility visibility;
  final List<Attachment> mediaAttachments;
  final List<Mention> mentions;
  final List<Tag> tags;

  @JsonKey(nullable: true)
  final Card card;

  final Application application;

  @JsonKey(nullable: true)
  final dynamic language;

  @JsonKey(nullable: true)
  final bool pinned;

  Status({
    this.id,
    this.uri,
    this.url,
    this.account,
    this.inReplyToId,
    this.inReplyToAccountId,
    this.reblog,
    this.content,
    this.created_at,
    this.emojis,
    this.repliesCount,
    this.reblogsCount,
    this.favouritesCount,
    this.reblogged,
    this.favourited,
    this.muted,
    this.sensitive,
    this.spoilerText,
    this.visibility,
    this.mediaAttachments,
    this.mentions,
    this.tags,
    this.card,
    this.application,
    this.language,
    this.pinned,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}
