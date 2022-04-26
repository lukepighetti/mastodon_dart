import 'package:json_annotation/json_annotation.dart';
import 'emoji.dart';

part 'poll.g.dart';

/// https://docs.joinmastodon.org/entities/poll/
/// Represents a poll attached to a status.
@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Poll {
  /// The ID of the poll in the database
  final String id;

  /// When the poll ends
  final DateTime? expiresAt;

  /// Is the poll currently expired?
  final bool expired;

  /// Does the poll allow multiple-choice answers?
  final bool multiple;

  /// How many votes have been received
  final int votes_count;

  /// How many unique accounts have voted on a multiple-choice poll
  final int voters_count;

  /// When called with a user token, has the authorized user voted?

  final bool? voted;

  /// When called with a user token, which options has the authorized user chosen? Contains an array of index values for [options].
  final List<int>? own_votes;

  /// Description: Possible answers for the poll.
  /// Type: Array of Hash
  ///
  /// options[][title]
  /// The text value of the poll option. String.
  ///
  /// options[][votes_count]
  /// The number of received votes for this option. Number, or null if results are not published yet.
  final Object? options;

  /// Custom emoji to be used for rendering poll options
  final List<Emoji> emojis;

  Poll({
    required this.id,
    required this.expiresAt,
    required this.expired,
    required this.multiple,
    required this.votes_count,
    required this.voters_count,
    required this.voted,
    required this.own_votes,
    required this.options,
    required this.emojis,
  });

  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);
}
