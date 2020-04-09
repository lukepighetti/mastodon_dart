import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

part 'filter.g.dart';

/// Represents a user-defined filter for determining which statuses should not be shown to the user.
/// https://docs.joinmastodon.org/entities/filter/
///
/// TODO: follow Implementation Notes

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Filter {
  /// The ID of the filter in the database
  final String id;

  /// The text to be filtered
  final String phrase;

  /// The contexts in which the filter should be applied. Enumerated by [FilterContext].
  /// - home = home timeline
  /// - notifications = notifications timeline
  /// - public = public timelines
  /// - thread = expanded thread of a detailed status
  final List<FilterContext> context;

  /// When the filter should no longer be applied
  @JsonKey(nullable: true)
  final DateTime expiresAt;

  /// Should matching entities in home and notifications be dropped by the server?
  final bool irreversible;

  /// Should the filter consider word boundaries?
  /// See [implementation notes](https://docs.joinmastodon.org/entities/filter/) in Mastodon docs
  final bool wholeWord;

  Filter({
    this.id,
    this.phrase,
    this.context,
    this.expiresAt,
    this.irreversible,
    this.wholeWord,
  });

  Filter.mock()
      : id = MockProperties.string,
        phrase = MockProperties.tag,
        context = MockProperties.randomSublist([
          FilterContext.home,
          FilterContext.notifications,
          FilterContext.public,
          FilterContext.thread,
        ]),
        expiresAt = MockProperties.pastDate,
        irreversible = MockProperties.boolean,
        wholeWord = MockProperties.boolean;

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
}

enum FilterContext { home, notifications, public, thread }
