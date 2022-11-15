import 'package:json_annotation/json_annotation.dart';

part 'mention.g.dart';

/// Represents a mention of a user within the content of a status.
/// https://docs.joinmastodon.org/entities/mention/

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Mention {
  /// The account id of the mentioned user
  final String id;

  /// The username of the mentioned user
  final String username;

  /// The webfinger acct: URI of the mentioned user. Equivalent to username for local users, or username@domain for remote users
  final String acct;

  /// The location of the mentioned user's profile
  final Uri url;

  Mention({
    required this.url,
    required this.username,
    required this.acct,
    required this.id,
  });

  factory Mention.fromJson(Map<String, dynamic> json) =>
      _$MentionFromJson(json);

  @override
  String toString() => "Mention("
      "$id, "
      "$username, "
      "$acct, "
      "$url"
      ")";
}
