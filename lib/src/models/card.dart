import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

/// Represents a rich preview card that is generated using OpenGraph tags from a URL.
/// https://docs.joinmastodon.org/entities/PreviewCard/

@JsonSerializable()
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
  @JsonKey(fromJson: _safeUriParse)
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

  /// A hash computed by the BlurHash algorithm, for generating colorful preview thumbnails when media has not been downloaded yet.
  final String? blurhash;

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
    required this.blurhash,
  });

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  static Uri? _safeUriParse(String url) => Uri.tryParse(url);

  Map<String, dynamic> toJson() => _$CardToJson(this);
}

enum CardType { link, photo, video, rich }
