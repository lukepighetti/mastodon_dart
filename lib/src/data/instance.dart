import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/mock/properties.dart';

import 'account.dart';

part 'instance.g.dart';

/// https://docs.joinmastodon.org/api/entities/#instance

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Instance {
  final Uri uri;
  final String title;
  final String description;
  final String email;
  final String version;

  @JsonKey(nullable: true)
  final Uri thumbnail;

  final dynamic urls;
  final InstanceStats stats;
  final dynamic languages;

  @JsonKey(nullable: true)
  final Account contactAccount;

  Instance({
    this.uri,
    this.title,
    this.description,
    this.email,
    this.version,
    this.thumbnail,
    this.urls,
    this.stats,
    this.languages,
    this.contactAccount,
  });

  Instance.mock()
      : uri = MockProperties.uri,
        title = MockProperties.tag,
        description = MockProperties.comment,
        email = MockProperties.email,
        version = MockProperties.version,
        thumbnail = MockProperties.iconUri,
        urls = null,
        stats = InstanceStats.mock(),
        languages = null,
        contactAccount = Account.mock();

  factory Instance.fromJson(Map<String, dynamic> json) =>
      _$InstanceFromJson(json);
}

/// https://docs.joinmastodon.org/api/entities/#stats

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class InstanceStats {
  final int userCount;
  final int statusCount;
  final int domainCount;

  InstanceStats({
    this.userCount,
    this.statusCount,
    this.domainCount,
  });

  InstanceStats.mock()
      : userCount = MockProperties.integer,
        statusCount = MockProperties.integer,
        domainCount = MockProperties.integer;

  factory InstanceStats.fromJson(Map<String, dynamic> json) =>
      _$InstanceStatsFromJson(json);
}
