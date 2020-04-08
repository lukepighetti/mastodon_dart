import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/mock/properties.dart';

part 'user_follows_list.g.dart';

/// Represents a list of some users that the authenticated user follows.
/// https://docs.joinmastodon.org/entities/list/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class UserFollowsList {
  final String id;
  final String title;

  UserFollowsList({this.id, this.title});

  UserFollowsList.mock()
      : id = MockProperties.string,
        title = MockProperties.tag;

  factory UserFollowsList.fromJson(Map<String, dynamic> json) =>
      _$UserFollowsListFromJson(json);
}
