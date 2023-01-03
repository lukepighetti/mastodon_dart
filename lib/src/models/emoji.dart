import 'package:json_annotation/json_annotation.dart';

part 'emoji.g.dart';

/// Represents a custom emoji.
/// https://docs.joinmastodon.org/entities/emoji/
@JsonSerializable()
class Emoji {
  /// The name of the custom emoji
  final String shortcode;

  /// A link to the custom emoji
  final Uri url;

  /// A link to a static copy of the custom emoji
  final Uri staticUrl;

  /// Whether this Emoji should be visible in the picker or unlisted
  final bool visibleInPicker;

  /// Used for sorting custom emoji in the picker
  final String? category;

  Emoji({
    required this.shortcode,
    required this.staticUrl,
    required this.url,
    required this.visibleInPicker,
    required this.category,
  });

  factory Emoji.fromJson(Map<String, dynamic> json) => _$EmojiFromJson(json);
}
