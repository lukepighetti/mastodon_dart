import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/mock/properties.dart';

part 'mention.g.dart';

/// Represents a mention of a user within the content of a status.
/// https://docs.joinmastodon.org/entities/mention/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Mention {
  final String id;
  final String username;
  final String acct;
  final Uri url;

  Mention({
    this.url,
    this.username,
    this.acct,
    this.id,
  });

  Mention.mock()
      : url = MockProperties.uri,
        username = MockProperties.username,
        acct = MockProperties.string,
        id = MockProperties.string;

  factory Mention.fromJson(Map<String, dynamic> json) =>
      _$MentionFromJson(json);
}
