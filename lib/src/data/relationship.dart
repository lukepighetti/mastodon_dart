import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

part 'relationship.g.dart';

/// Represents the relationship between accounts, such as following / blocking / muting / etc.
/// https://docs.joinmastodon.org/entities/relationship/

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Relationship {
  /// The account id
  final String id;

  /// Are you following this user?
  final bool following;

  /// Do you have a pending follow request for this user?
  final bool requested;

  /// Are you featuring this user on your profile?
  final bool endorsed;

  /// Are you followed by this user?
  final bool followedBy;

  /// Are you muting this user?
  final bool muting;

  /// Are you muting notifications from this user?
  final bool mutingNotifications;

  /// Are you receiving this user's boosts in your home timeline?
  final bool showingReblogs;

  /// Are you blocking this user?
  final bool blocking;

  /// Are you blocking this user's domain?
  final bool domainBlocking;

  /// Is this user blocking you?
  final bool blockedBy;

  Relationship({
    required this.id,
    required this.following,
    required this.followedBy,
    required this.blocking,
    required this.muting,
    required this.mutingNotifications,
    required this.requested,
    required this.domainBlocking,
    required this.showingReblogs,
    required this.endorsed,
    required this.blockedBy,
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
