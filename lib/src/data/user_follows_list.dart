import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

part 'user_follows_list.g.dart';

/// Represents a list of some users that the authenticated user follows.
/// Cannot be named `List` because `List` is reserved in Dart.
/// https://docs.joinmastodon.org/entities/list/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class UserFollowsList {
  /// The internal database ID of the lis
  final String id;

  /// The user-defined title of the list
  final String title;

  UserFollowsList({this.id, this.title});

  UserFollowsList.mock()
      : id = MockProperties.string,
        title = MockProperties.tag;

  factory UserFollowsList.fromJson(Map<String, dynamic> json) =>
      _$UserFollowsListFromJson(json);
}
