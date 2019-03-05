import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon/mock/properties.dart';

part 'tag.g.dart';

/// https://docs.joinmastodon.org/api/entities/#tag

@JsonSerializable(
  nullable: true,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Tag {
  final String name;
  final Uri url;

  @JsonKey(nullable: true)
  final List<History> history;

  Tag({
    this.name,
    this.url,
    this.history,
  });

  Tag.mock()
      : name = MockProperties.tag,
        url = MockProperties.uri,
        history = [
          History.mock(),
          History.mock(),
          History.mock(),
        ];

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

/// https://docs.joinmastodon.org/api/entities/#history

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class History {
  final DateTime day;

  @JsonKey(fromJson: _stringToInt)
  final int uses;

  @JsonKey(fromJson: _stringToInt)
  final int accounts;

  History({
    this.day,
    this.uses,
    this.accounts,
  });

  static _stringToInt(String s) => int.parse(s);

  History.mock()
      : day = MockProperties.pastDate,
        uses = MockProperties.integer,
        accounts = MockProperties.integer;

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}
