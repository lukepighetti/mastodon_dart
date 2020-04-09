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
  final String id;
  final String name;
  final int statusesCount;
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

  factory FeaturedTag.fromJson(Map<String, dynamic> json) => _$FeaturedTagFromJson(json);
}
