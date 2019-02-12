import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon/mock/properties.dart';

part 'relationship.g.dart';

/// https://docs.joinmastodon.org/api/entities/#relationship

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Relationship {
  final String id;
  final bool following;
  final bool followedBy;
  final bool blocking;
  final bool muting;
  final bool mutingNotifications;
  final bool requested;
  final bool domainBlocking;
  final bool showingReblogs;
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
        endorsed = MockProperties.boolean;

  factory Relationship.fromJson(Map<String, dynamic> json) =>
      _$RelationshipFromJson(json);
}
