import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

part 'emoji.g.dart';

/// Represents a custom emoji.
/// https://docs.joinmastodon.org/entities/emoji/
//todo: add category property

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Emoji {
  final String shortcode;
  final Uri url;
  final Uri staticUrl;
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
