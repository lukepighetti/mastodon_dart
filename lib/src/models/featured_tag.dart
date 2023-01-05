import 'package:json_annotation/json_annotation.dart';

part 'featured_tag.g.dart';

/// Represents a hashtag that is featured on a profile.
/// https://docs.joinmastodon.org/entities/featuredtag/

@JsonSerializable()
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
    required this.id,
    required this.name,
    required this.statusesCount,
    required this.lastStatusAt,
  });

  factory FeaturedTag.fromJson(Map<String, dynamic> json) =>
      _$FeaturedTagFromJson(json);
  Map<String, dynamic> toJson() => _$FeaturedTagToJson(this);
}
