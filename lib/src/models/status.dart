import 'package:json_annotation/json_annotation.dart';
import 'poll.dart';
import 'account.dart';
import 'application.dart';
import 'attachment.dart';
import 'card.dart';
import 'emoji.dart';
import 'mention.dart';
import 'tag.dart';
import 'visibility.dart';

part 'status.g.dart';

/// Represents a status posted by an account.
/// https://docs.joinmastodon.org/entities/status/

@JsonSerializable()
class Status {
  /// ID of the status in the database
  final String id;

  /// URI of the status used for federation
  final String uri;

  /// The date when this status was created
  final DateTime createdAt;

  /// The account that authored this status
  final Account account;

  /// Represents the HTML content string of a Status
  final String content;

  /// Visibility of this status. Enumerated by [Visibility]
  final Visibility visibility;

  /// Is this status marked as sensitive content?
  final bool sensitive;

  /// Subject or summary line, below which status content is collapsed until expanded
  final String spoilerText;

  /// Media that is attached to this status
  final List<Attachment> mediaAttachments;

  /// The application used to post this status
  final Application? application;

  /// Mentions of users within the status content
  final List<Mention> mentions;

  /// Hashtags used within the status content
  /// TODO: handle empty lists
  final List<Tag> tags;

  /// Custom emoji to be used when rendering status content
  final List<Emoji> emojis;

  /// How many boosts this status has received
  final int reblogsCount;

  /// How many favourites this status has received
  final int favouritesCount;

  /// How many replies this status has received
  final int repliesCount;

  /// A link to the status's HTML representation
  final Uri? url;

  /// ID of the status being replied
  final String? inReplyToId;

  /// ID of the account being replied to
  final String? inReplyToAccountId;

  /// The status being reblogged
  final Status? reblog;

  /// The poll attached to the status
  final Poll? poll;

  /// Preview card for links included within status content
  final Card? card;

  /// Primary language of this status
  final Object? language;

  /// Plain-text source of a status. Returned instead of content when status is deleted,
  /// so the user may redraft from the source text without the client having to reverse-engineer the original text from the HTML content.
  final String? text;

  /// Have you favourited this status?
  @JsonKey(defaultValue: false)
  final bool favourited;

  /// Have you boosted this status?
  @JsonKey(defaultValue: false)
  final bool reblogged;

  /// Have you muted notifications for this status's conversation?
  @JsonKey(defaultValue: false)
  final bool muted;

  /// Have you bookmarked this status?
  final bool bookmarked;

  /// Have you pinned this status? Only appears if the status is pinnable.
  @JsonKey(defaultValue: false)
  final bool pinned;

  Status({
    required this.id,
    required this.uri,
    required this.url,
    required this.account,
    required this.inReplyToId,
    required this.inReplyToAccountId,
    required this.reblog,
    required this.content,
    required this.text,
    required this.createdAt,
    required this.emojis,
    required this.repliesCount,
    required this.reblogsCount,
    required this.favouritesCount,
    required this.reblogged,
    required this.favourited,
    required this.muted,
    required this.bookmarked,
    required this.sensitive,
    required this.spoilerText,
    required this.visibility,
    required this.mediaAttachments,
    required this.mentions,
    required this.tags,
    required this.card,
    required this.application,
    required this.language,
    required this.pinned,
    required this.poll,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
