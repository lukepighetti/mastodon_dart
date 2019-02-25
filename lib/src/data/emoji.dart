import 'package:json_annotation/json_annotation.dart';

import 'package:mastodon/src/mock/properties.dart';

part 'emoji.g.dart';

/// https://docs.joinmastodon.org/api/entities/#emoji

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Emoji {
  final String shortcode;
  final Uri staticUrl;
  final Uri url;
  final bool visibleInPicker;

  Emoji({
    this.shortcode,
    this.staticUrl,
    this.url,
    this.visibleInPicker,
  });

  Emoji.mock()
      : shortcode = MockProperties.tag,
        staticUrl = MockProperties.emojiUri,
        url = MockProperties.emojiUri,
        visibleInPicker = MockProperties.boolean;

  factory Emoji.fromJson(Map<String, dynamic> json) => _$EmojiFromJson(json);
}
