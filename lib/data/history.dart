import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon/mock/properties.dart';

part 'history.g.dart';

/// https://docs.joinmastodon.org/api/entities/#history

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class History {
  final DateTime day;
  final int uses;
  final int accounts;

  History({
    this.day,
    this.uses,
    this.accounts,
  });

  History.mock()
      : day = MockProperties.pastDate,
        uses = MockProperties.integer,
        accounts = MockProperties.integer;

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}
