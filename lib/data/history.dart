import 'package:json_annotation/json_annotation.dart';

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

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}
