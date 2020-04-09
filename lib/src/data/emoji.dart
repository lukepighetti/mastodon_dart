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
  /// The name of the custom emoji
  final String shortcode;

  /// A link to the custom emoji
  final Uri url;

  /// A link to a static copy of the custom emoji
  final Uri staticUrl;

  /// Whether this Emoji should be visible in the picker or unlisted
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
