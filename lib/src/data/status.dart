import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/mock/properties.dart';
import 'poll.dart';
import 'account.dart';
import 'application.dart';
import 'attachment.dart';
import 'card.dart';
import 'emoji.dart';
import 'mention.dart';
import 'tag.dart';
import 'shared/visibility.dart';

part 'status.g.dart';

/// Represents a status posted by an account.
/// https://docs.joinmastodon.org/entities/status/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Status {
  final String id;
  final DateTime createdAt;

  @JsonKey(nullable: true)
  final String inReplyToId;

  @JsonKey(nullable: true)
  final String inReplyToAccountId;

  final bool sensitive;
  final String spoilerText;
  final Visibility visibility;

  @JsonKey(nullable: true)
  final dynamic language;

  final String uri;

  @JsonKey(nullable: true)
  final Uri url;

  final int repliesCount;
  final int reblogsCount;
  final int favouritesCount;

  @JsonKey(nullable: true, defaultValue: false)
  final bool favourited;

  @JsonKey(nullable: true, defaultValue: false)
  final bool reblogged;

  @JsonKey(nullable: true, defaultValue: false)
  final bool muted;

  final bool bookmarked;

  /// Represents the HTML content string of a Status
  final String content;

  @JsonKey(nullable: true)
  final Status reblog;

  @JsonKey(nullable: true)
  final Application application;

  final Account account;
  final List<Attachment> mediaAttachments;
  final List<Mention> mentions;

  /// TODO: handle empty lists
  final List<Tag> tags;

  final List<Emoji> emojis;

  @JsonKey(nullable: true)
  final Card card;

  /// Represents the plaintext string of a Status
  final String text;

  @JsonKey(nullable: true, defaultValue: false)
  final bool pinned;

  @JsonKey(nullable: true)
  final Poll poll;

  Status({
    this.id,
    this.uri,
    this.url,
    this.account,
    this.inReplyToId,
    this.inReplyToAccountId,
    this.reblog,
    this.content,
    this.text,
    this.createdAt,
    this.emojis,
    this.repliesCount,
    this.reblogsCount,
    this.favouritesCount,
    this.reblogged,
    this.favourited,
    this.muted,
    this.bookmarked,
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
    this.poll,
  });

  Status.mock()
      : id = MockProperties.string,
        uri = MockProperties.uri.toString(),
        url = MockProperties.uri,
        account = Account.mock(),
        inReplyToId = MockProperties.string,
        inReplyToAccountId = MockProperties.string,
        reblog = null,
        content = MockProperties.comment,
        text = MockProperties.text,
        createdAt = MockProperties.pastDate,
        emojis = [Emoji.mock(), Emoji.mock(), Emoji.mock()],
        repliesCount = MockProperties.integer,
        reblogsCount = MockProperties.integer,
        favouritesCount = MockProperties.integer,
        reblogged = MockProperties.boolean,
        favourited = MockProperties.boolean,
        bookmarked = MockProperties.boolean,
        muted = MockProperties.boolean,
        sensitive = MockProperties.boolean,
        spoilerText = "spoiler!",
        visibility = MockProperties.randomItem([
          Visibility.direct,
          Visibility.private,
          Visibility.public,
          Visibility.unlisted
        ]),
        mediaAttachments = MockProperties.randomSublist<Attachment>([
          Attachment.mock(),
          Attachment.mock(),
          Attachment.mock(),
        ]),
        mentions = MockProperties.randomSublist<Mention>([
          Mention.mock(),
          Mention.mock(),
          Mention.mock(),
        ]),
        tags = MockProperties.randomSublist<Tag>([
          Tag.mock(),
          Tag.mock(),
          Tag.mock(),
        ]),
        card = Card.mock(),
        application = Application.mock(),
        language = MockProperties.string,
        pinned = MockProperties.boolean,
        poll = null; //todo: set mock poll options

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}
