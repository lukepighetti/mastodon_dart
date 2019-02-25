import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon/src/mock/properties.dart';

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
