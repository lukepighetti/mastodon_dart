import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';
import 'emoji.dart';

part 'poll.g.dart';

/// https://docs.joinmastodon.org/entities/poll/
/// Represents a poll attached to a status.
@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Poll {
  /// The ID of the poll in the database
  final String id;

  /// When the poll ends
  @JsonKey(nullable: true)
  final DateTime expiresAt;

  /// Is the poll currently expired?
  final bool expired;

  /// Does the poll allow multiple-choice answers?
  final bool multiple;

  /// How many votes have been received
  final int votes_count;

  /// How many unique accounts have voted on a multiple-choice poll
  final int voters_count;

  /// When called with a user token, has the authorized user voted?
  @JsonKey(nullable: true)
  final bool voted;

  /// When called with a user token, which options has the authorized user chosen? Contains an array of index values for [options].
  @JsonKey(nullable: true)
  final List<int> own_votes;

  /// Description: Possible answers for the poll.
  /// Type: Array of Hash
  ///
  /// options[][title]
  /// The text value of the poll option. String.
  ///
  /// options[][votes_count]
  /// The number of received votes for this option. Number, or null if results are not published yet.
  @JsonKey(nullable: true)
  final dynamic options;
  /// Custom emoji to be used for rendering poll options
  final List<Emoji> emojis;

  Poll({
    this.id,
    this.expiresAt,
    this.expired,
    this.multiple,
    this.votes_count,
    this.voters_count,
    this.voted,
    this.own_votes,
    this.options,
    this.emojis,
  });

  Poll.mock()
      : id = MockProperties.string,
        expiresAt = MockProperties.pastDate,
        expired = MockProperties.boolean,
        multiple = MockProperties.boolean,
        votes_count = MockProperties.integer,
        voters_count = MockProperties.integer,
        voted = MockProperties.boolean,
        own_votes = MockProperties.randomSublist([3]),
        options = null, //todo: set mock poll
        emojis =
            List.generate(4, (index) => Emoji.mock()); //todo: make list random

  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);
}
