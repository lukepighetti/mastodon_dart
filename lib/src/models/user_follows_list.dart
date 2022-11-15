import 'package:json_annotation/json_annotation.dart';

part 'user_follows_list.g.dart';

/// Represents a list of some users that the authenticated user follows.
/// Cannot be named `List` because `List` is reserved in Dart.
/// https://docs.joinmastodon.org/entities/list/

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class UserFollowsList {
  /// The internal database ID of the lis
  final String id;

  /// The user-defined title of the list
  final String title;

  UserFollowsList({
    required this.id,
    required this.title,
  });

  factory UserFollowsList.fromJson(Map<String, dynamic> json) =>
      _$UserFollowsListFromJson(json);

  @override
  String toString() => "UserFollowsList("
      "$id, "
      "$title"
      ")";
}