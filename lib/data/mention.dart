import 'package:json_annotation/json_annotation.dart';

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

  factory Mention.fromJson(Map<String, dynamic> json) =>
      _$MentionFromJson(json);
}
