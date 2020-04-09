import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

part 'featured_tag.g.dart';

/// Represents a hashtag that is featured on a profile.
/// https://docs.joinmastodon.org/entities/featuredtag/

@JsonSerializable(
  nullable: true,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class FeaturedTag {
  /// The internal ID of the featured tag in the database
  final String id;

  /// The name of the hashtag being featured
  final String name;

  /// The number of authored statuses containing this hashtag
  final int statusesCount;

  /// The timestamp of the last authored status containing this hashtag
  final DateTime lastStatusAt;

  FeaturedTag({
    this.id,
    this.name,
    this.statusesCount,
    this.lastStatusAt,
  });

  FeaturedTag.mock()
      : id = MockProperties.string,
        name = MockProperties.tag,
        statusesCount = MockProperties.integer,
        lastStatusAt = MockProperties.pastDate;

  factory FeaturedTag.fromJson(Map<String, dynamic> json) =>
      _$FeaturedTagFromJson(json);
}
