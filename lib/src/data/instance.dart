import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/mock/properties.dart';
import 'account.dart';

part 'instance.g.dart';

/// Represents the software instance of Mastodon running on this domain.
/// https://docs.joinmastodon.org/entities/instance/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Instance {
  final Uri uri;
  final String title;
  final String shortDescription;
  final String description;
  final String email;
  final String version;
  final dynamic urls;
  final InstanceStats stats; //todo: turn into a List<Language>

  @JsonKey(nullable: true)
  final Uri thumbnail;

  final dynamic languages;
  final bool registrations;
  final bool contact_required;

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
    this.shortDescription,
    this.registrations,
    this.contact_required,
  });

  Instance.mock()
      : uri = MockProperties.uri,
        title = MockProperties.tag,
        shortDescription = MockProperties.comment,
        description = MockProperties.comment,
        email = MockProperties.email,
        version = MockProperties.version,
        thumbnail = MockProperties.iconUri,
        urls = null,
        stats = InstanceStats.mock(),
        languages = null,
        registrations = MockProperties.boolean,
        contact_required = MockProperties.boolean,
        contactAccount = Account.mock();

  factory Instance.fromJson(Map<String, dynamic> json) =>
      _$InstanceFromJson(json);
}

/// Listed in https://docs.joinmastodon.org/entities/instance/

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
