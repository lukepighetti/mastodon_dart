import 'package:json_annotation/json_annotation.dart';

part 'option.g.dart';

/// https://docs.joinmastodon.org/entities/Poll/#Option
/// Represents an option attached to a poll.
@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Option {
  /// The text value of the poll option
  final String title;

  /// The total number of received votes for this option.
  final int? votesCount;

  Option({
    required this.title,
    required this.votesCount,
  });

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
