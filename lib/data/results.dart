import 'package:json_annotation/json_annotation.dart';

import 'account.dart';
import 'status.dart';
import 'tag.dart';

part 'results.g.dart';

/// https://docs.joinmastodon.org/api/entities/#results

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Results {
  final List<Account> accounts;
  final List<Status> statuses;
  final List<Tag> hashtags;

  Results({
    this.accounts,
    this.statuses,
    this.hashtags,
  });

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}
