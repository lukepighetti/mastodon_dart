import 'package:json_annotation/json_annotation.dart';

import 'account.dart';

part 'instance.g.dart';

/// https://docs.joinmastodon.org/api/entities/#instance

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Instance {
  final String uri;
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

  factory Instance.fromJson(Map<String, dynamic> json) =>
      _$InstanceFromJson(json);
}

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

  factory InstanceStats.fromJson(Map<String, dynamic> json) =>
      _$InstanceStatsFromJson(json);
}
