import 'package:json_annotation/json_annotation.dart';

part 'filter.g.dart';

/// Represents a user-defined filter for determining which statuses should not be shown to the user.
/// https://docs.joinmastodon.org/entities/filter/
///
/// TODO: follow Implementation Notes

@JsonSerializable()
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
  final DateTime? expiresAt;

  /// Should matching entities in home and notifications be dropped by the server?
  final bool irreversible;

  /// Should the filter consider word boundaries?
  /// See [implementation notes](https://docs.joinmastodon.org/entities/filter/) in Mastodon docs
  final bool wholeWord;

  Filter({
    required this.id,
    required this.phrase,
    required this.context,
    required this.expiresAt,
    required this.irreversible,
    required this.wholeWord,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

enum FilterContext { home, notifications, public, thread }
