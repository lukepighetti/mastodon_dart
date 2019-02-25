import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon/src/mock/properties.dart';

part 'list_summary.g.dart';

/// https://docs.joinmastodon.org/api/entities/#ListItem

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class ListSummary {
  final String id;
  final String title;

  ListSummary({this.id, this.title});

  ListSummary.mock()
      : id = MockProperties.string,
        title = MockProperties.tag;

  factory ListSummary.fromJson(Map<String, dynamic> json) =>
      _$ListSummaryFromJson(json);
}
