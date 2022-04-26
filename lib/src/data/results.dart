import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

import 'account.dart';
import 'status.dart';
import 'tag.dart';

part 'results.g.dart';

/// Represents the results of a search.
/// https://docs.joinmastodon.org/entities/results/

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Results {
  /// Accounts which match the given query
  final List<Account> accounts;

  /// Statuses which match the given query
  final List<Status> statuses;

  /// Hashtags which match the given query
  final List<Tag> hashtags;

  Results({
    required this.accounts,
    required this.statuses,
    required this.hashtags,
  });

  Results.mock()
      : accounts = MockProperties.randomSublist([
          Account.mock(),
          Account.mock(),
          Account.mock(),
          Account.mock(),
          Account.mock(),
        ]),
        statuses = MockProperties.randomSublist([
          Status.mock(),
          Status.mock(),
          Status.mock(),
          Status.mock(),
          Status.mock(),
        ]),
        hashtags = MockProperties.randomSublist([
          Tag.mock(),
          Tag.mock(),
          Tag.mock(),
          Tag.mock(),
          Tag.mock(),
        ]);

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}
