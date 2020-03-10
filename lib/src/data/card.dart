import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/mock/properties.dart';

part 'card.g.dart';

/// https://docs.joinmastodon.org/api/entities/#card

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Card {
  final Uri url;
  final String title;
  final String description;

  @JsonKey(nullable: true)
  final Uri image;

  final CardType type;

  @JsonKey(nullable: true)
  final String authorName;

  @JsonKey(nullable: true)
  final Uri authorUrl;

  @JsonKey(nullable: true)
  final String providerName;

  @JsonKey(nullable: true)
  final Uri providerUrl;

  @JsonKey(nullable: true)
  final String html;

  @JsonKey(nullable: true)
  final int width;

  @JsonKey(nullable: true)
  final int height;

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
        height = 600;

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
}

/// https://docs.joinmastodon.org/api/entities/#type-1

enum CardType { link, photo, video, rich }
