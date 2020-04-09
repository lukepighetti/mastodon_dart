import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/mock/properties.dart';

part 'relationship.g.dart';

/// Represents the relationship between accounts, such as following / blocking / muting / etc.
/// https://docs.joinmastodon.org/entities/relationship/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Relationship {
  final String id;
  final bool following;
  final bool showingReblogs;
  final bool followedBy;
  final bool blocking;
  final bool blockedBy;
  final bool muting;
  final bool mutingNotifications;
  final bool requested;
  final bool domainBlocking;
  final bool endorsed;

  Relationship({
    this.id,
    this.following,
    this.followedBy,
    this.blocking,
    this.muting,
    this.mutingNotifications,
    this.requested,
    this.domainBlocking,
    this.showingReblogs,
    this.endorsed,
    this.blockedBy,
  });

  Relationship.mock()
      : id = MockProperties.string,
        following = MockProperties.boolean,
        followedBy = MockProperties.boolean,
        blocking = MockProperties.boolean,
        muting = MockProperties.boolean,
        mutingNotifications = MockProperties.boolean,
        requested = MockProperties.boolean,
        domainBlocking = MockProperties.boolean,
        showingReblogs = MockProperties.boolean,
        endorsed = MockProperties.boolean,
        blockedBy = MockProperties.boolean;

  factory Relationship.fromJson(Map<String, dynamic> json) =>
      _$RelationshipFromJson(json);
}
