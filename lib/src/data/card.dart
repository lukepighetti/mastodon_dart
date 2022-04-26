import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

/// Represents a rich preview card that is generated using OpenGraph tags from a URL.
/// https://docs.joinmastodon.org/entities/card/

@JsonSerializable(
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
  final String? authorName;

  /// A link to the author of the original resource
  final Uri? authorUrl;

  /// The provider of the original resource
  final String? providerName;

  /// A link to the provider of the original resource
  final Uri? providerUrl;

  /// HTML to be used for generating the preview card
  final String? html;

  /// Width of preview, in pixels
  final int? width;

  /// Height of preview, in pixels
  final int? height;

  /// Preview thumbnail
  final Uri? image;

  /// Used for photo embeds, instead of custom [html]
  final Uri embedUrl;

  Card({
    required this.url,
    required this.title,
    required this.description,
    required this.image,
    required this.type,
    required this.authorName,
    required this.authorUrl,
    required this.providerName,
    required this.providerUrl,
    required this.html,
    required this.width,
    required this.height,
    required this.embedUrl,
  });

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
}

enum CardType { link, photo, video, rich }
