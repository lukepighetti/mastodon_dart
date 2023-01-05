import 'package:json_annotation/json_annotation.dart';
import 'emoji.dart';
import 'option.dart';

part 'poll.g.dart';

/// https://docs.joinmastodon.org/entities/poll/
/// Represents a poll attached to a status.
@JsonSerializable()
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
  final int votesCount;

  /// How many unique accounts have voted on a multiple-choice poll
  final int votersCount;

  /// When called with a user token, has the authorized user voted?

  final bool? voted;

  /// When called with a user token, which options has the authorized user chosen? Contains an array of index values for [options].
  final List<int>? ownVotes;

  /// Description: Possible answers for the poll.
  /// Type: Array of Hash
  ///
  /// options[][title]
  /// The text value of the poll option. String.
  ///
  /// options[][votesCount]
  /// The number of received votes for this option. Number, or null if results are not published yet.
  final List<Option> options;

  /// Custom emoji to be used for rendering poll options
  final List<Emoji> emojis;

  Poll({
    required this.id,
    required this.expiresAt,
    required this.expired,
    required this.multiple,
    required this.votesCount,
    required this.votersCount,
    required this.voted,
    required this.ownVotes,
    required this.options,
    required this.emojis,
  });

  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);
  Map<String, dynamic> toJson() => _$PollToJson(this);
}
