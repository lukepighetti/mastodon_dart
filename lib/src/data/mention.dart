import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon/src/mock/properties.dart';

part 'mention.g.dart';

/// https://docs.joinmastodon.org/api/entities/#mention

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Mention {
  final Uri url;
  final String username;
  final String account;
  final String id;

  Mention({
    this.url,
    this.username,
    this.account,
    this.id,
  });

  Mention.mock()
      : url = MockProperties.uri,
        username = MockProperties.username,
        account = MockProperties.string,
        id = MockProperties.string;

  factory Mention.fromJson(Map<String, dynamic> json) =>
      _$MentionFromJson(json);
}
