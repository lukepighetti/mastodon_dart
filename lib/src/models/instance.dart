import 'package:json_annotation/json_annotation.dart';
import 'account.dart';

part 'instance.g.dart';

/// Represents the software instance of Mastodon running on required this domain.
/// https://docs.joinmastodon.org/entities/instance/

@JsonSerializable(
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
  final Uri? thumbnail;

  /// A user that can be contacted, as an alternative to email
  final Account? contactAccount;

  Instance({
    required this.uri,
    required this.title,
    required this.description,
    required this.email,
    required this.version,
    required this.thumbnail,
    required this.urls,
    required this.stats,
    required this.languages,
    required this.contactAccount,
    required this.shortDescription,
    required this.registrations,
    required this.approvalRequired,
  });

  factory Instance.fromJson(Map<String, dynamic> json) =>
      _$InstanceFromJson(json);
}

/// Statistics about how much information the instance contains
/// Listed in https://docs.joinmastodon.org/entities/instance/

@JsonSerializable(
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
    required this.userCount,
    required this.statusCount,
    required this.domainCount,
  });

  factory InstanceStats.fromJson(Map<String, dynamic> json) =>
      _$InstanceStatsFromJson(json);
}
