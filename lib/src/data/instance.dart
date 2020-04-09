import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';
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
  /// The domain name of the instance
  final Uri uri;

  /// The title of the website
  final String title;

  /// Admin-defined description of the Mastodon site
  final String description;

  /// A shorter description defined by the admin
  final String shortDescription;

  /// An email that may be contacted for any inquiries
  final String email;

  /// The version of Mastodon installed on the instance
  final String version;

  /// Primary langauges of the website and its staff
  final dynamic languages;

  /// Whether registrations are enabled
  final bool registrations;

  /// Whether registrations require moderator approval
  final bool approvalRequired;

  /// URLs of interest for clients apps
  final dynamic urls;

  /// See [InstanceStats]
  final InstanceStats stats;

  /// Banner image for the website
  @JsonKey(nullable: true)
  final Uri thumbnail;

  /// A user that can be contacted, as an alternative to email
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
    this.approvalRequired,
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
        approvalRequired = MockProperties.boolean,
        contactAccount = Account.mock();

  factory Instance.fromJson(Map<String, dynamic> json) =>
      _$InstanceFromJson(json);
}

/// Statistics about how much information the instance contains
/// Listed in https://docs.joinmastodon.org/entities/instance/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class InstanceStats {
  /// Users registered on this instance
  final int userCount;

  /// Statuses authored by users on instance
  final int statusCount;

  /// Domains federated with this instance
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
