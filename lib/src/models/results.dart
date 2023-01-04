import 'package:json_annotation/json_annotation.dart';

import 'account.dart';
import 'status.dart';
import 'tag.dart';

part 'results.g.dart';

/// Represents the results of a search.
/// https://docs.joinmastodon.org/entities/results/

@JsonSerializable()
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

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}
