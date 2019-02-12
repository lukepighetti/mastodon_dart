import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon/mock/properties.dart';

import 'history.dart';

part 'tag.g.dart';

/// https://docs.joinmastodon.org/api/entities/#tag

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Tag {
  final String name;
  final Uri website;

  @JsonKey(nullable: true)
  final List<History> history;

  Tag({
    this.name,
    this.website,
    this.history,
  });

  Tag.mock()
      : name = MockProperties.tag,
        website = MockProperties.uri,
        history = [
          History.mock(),
          History.mock(),
          History.mock(),
        ];

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
