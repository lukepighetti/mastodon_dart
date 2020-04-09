import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';
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
  @JsonKey(nullable: true)
  final Application application;

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
  @JsonKey(nullable: true)
  final Uri url;

  /// ID of the status being replied
  @JsonKey(nullable: true)
  final String inReplyToId;

  /// ID of the account being replied to
  @JsonKey(nullable: true)
  final String inReplyToAccountId;

  /// The status being reblogged
  @JsonKey(nullable: true)
  final Status reblog;

  /// The poll attached to the status
  @JsonKey(nullable: true)
  final Poll poll;

  /// Preview card for links included within status content
  @JsonKey(nullable: true)
  final Card card;

  /// Primary language of this status
  @JsonKey(nullable: true)
  final dynamic language;

  /// Plain-text source of a status. Returned instead of content when status is deleted,
  /// so the user may redraft from the source text without the client having to reverse-engineer the original text from the HTML content.
  final String text;

  /// Have you favourited this status?
  @JsonKey(nullable: true, defaultValue: false)
  final bool favourited;

  /// Have you boosted this status?
  @JsonKey(nullable: true, defaultValue: false)
  final bool reblogged;

  /// Have you muted notifications for this status's conversation?
  @JsonKey(nullable: true, defaultValue: false)
  final bool muted;

  /// Have you bookmarked this status?
  final bool bookmarked;

  /// Have you pinned this status? Only appears if the status is pinnable.
  @JsonKey(nullable: true, defaultValue: false)
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
