import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

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

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
}

enum CardType { link, photo, video, rich }
