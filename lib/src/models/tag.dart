import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

/// Represents a hashtag used within the content of a status.
/// https://docs.joinmastodon.org/entities/tag/

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Tag {
  /// The value of the hashtag after the # sign
  final String name;

  /// A link to the hashtag on the instance
  final Uri url;

  /// Usage statistics for given days

  final List<History>? history;

  Tag({
    required this.name,
    required this.url,
    required this.history,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

/// Represents daily usage history of a hashtag.
/// https://docs.joinmastodon.org/entities/history/

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class History {
  /// UNIX timestamp on midnight of the given day
  final DateTime day;

  /// The counted usage of the tag within that day
  @JsonKey(fromJson: _stringToInt)
  final int uses;

  /// The total of accounts using the tag within that day
  @JsonKey(fromJson: _stringToInt)
  final int accounts;

  History({
    required this.day,
    required this.uses,
    required this.accounts,
  });

  static _stringToInt(String s) => int.parse(s);

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}
