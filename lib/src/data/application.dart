import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

part 'application.g.dart';

/// Represents an application that interfaces with the REST API to access accounts or post statuses.
/// https://docs.joinmastodon.org/entities/application/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Application {
  /// The name of your application
  final String name;

  /// The website associated with your application
  @JsonKey(nullable: true)
  final Uri website;

  /// Used for Push Streaming API. Returned with POST /api/v1/apps
  final String vapid_key;

  Application({
    this.name,
    this.website,
    this.vapid_key,
  });

  Application.mock()
      : name = MockProperties.firstName,
        website = MockProperties.uri,
        vapid_key = MockProperties.string;

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);
}

/// Represents an authenticated [Application]

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class AuthenticatedApplication extends Application {
  /// The name of your application
  final String name;

  /// The website associated with your application
  @JsonKey(nullable: true)
  final Uri website;

  /// The clientId associated with your application
  final String clientId;

  /// The clientSecret associated with your application
  final String clientSecret;

  AuthenticatedApplication({
    this.name,
    this.website,
    this.clientId,
    this.clientSecret,
  });

  AuthenticatedApplication.mock()
      : name = MockProperties.firstName,
        website = MockProperties.uri,
        clientId = MockProperties.string,
        clientSecret = MockProperties.string;

  factory AuthenticatedApplication.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatedApplicationFromJson(json);
}
