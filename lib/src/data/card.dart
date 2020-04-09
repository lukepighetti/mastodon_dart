import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

part 'card.g.dart';

/// Represents a rich preview card that is generated using OpenGraph tags from a URL.
/// https://docs.joinmastodon.org/entities/card/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Card {
  /// Location of linked resource
  final Uri url;

  /// Title of linked resource
  final String title;

  /// Description of preview
  final String description;

  /// The type of the preview card. Enumerated by [CardType]
  /// - link = Link OEmbed
  /// - photo = Photo OEmbed
  /// - video = Video OEmbed
  /// - rich = iframe OEmbed. Not currently accepted, so won't show up in practice.
  final CardType type;

  /// The author of the original resource
  @JsonKey(nullable: true)
  final String authorName;

  /// A link to the author of the original resource
  @JsonKey(nullable: true)
  final Uri authorUrl;

  /// The provider of the original resource
  @JsonKey(nullable: true)
  final String providerName;

  /// A link to the provider of the original resource
  @JsonKey(nullable: true)
  final Uri providerUrl;

  /// HTML to be used for generating the preview card
  @JsonKey(nullable: true)
  final String html;

  /// Width of preview, in pixels
  @JsonKey(nullable: true)
  final int width;

  /// Height of preview, in pixels
  @JsonKey(nullable: true)
  final int height;

  /// Preview thumbnail
  @JsonKey(nullable: true)
  final Uri image;

  /// Used for photo embeds, instead of custom [html]
  final Uri embedUrl;

  Card({
    this.url,
    this.title,
    this.description,
    this.image,
    this.type,
    this.authorName,
    this.authorUrl,
    this.providerName,
    this.providerUrl,
    this.html,
    this.width,
    this.height,
    this.embedUrl,
  });

  /// TODO: properly mock CardType and its link
  Card.mock()
      : url = MockProperties.uri,
        title = MockProperties.subject,
        description = MockProperties.comment,
        image = MockProperties.headerUri,
        type = CardType.link,
        authorName = MockProperties.fullName,
        authorUrl = MockProperties.uri,
        providerName = MockProperties.firstName,
        providerUrl = MockProperties.uri,
        html = MockProperties.html,
        width = 400,
        height = 600,
        embedUrl = MockProperties.uri;

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
}

enum CardType { link, photo, video, rich }
