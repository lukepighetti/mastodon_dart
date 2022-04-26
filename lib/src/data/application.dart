import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

part 'application.g.dart';

/// Represents an application that interfaces with the REST API to access accounts or post statuses.
/// https://docs.joinmastodon.org/entities/application/

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Application {
  /// The name of your application
  final String name;

  /// The website associated with your application

  final Uri? website;

  /// Used for Push Streaming API. Returned with POST /api/v1/apps
  final String vapid_key;

  Application({
    required this.name,
    required this.website,
    required this.vapid_key,
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
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class AuthenticatedApplication extends Application {
  /// The clientId associated with your application
  final String clientId;

  /// The clientSecret associated with your application
  final String clientSecret;

  AuthenticatedApplication({
    required String name,
    required Uri? website,
    required String vapid_key,
    required this.clientId,
    required this.clientSecret,
  }) : super(name: name, website: website, vapid_key: vapid_key);

  AuthenticatedApplication.mock()
      : clientId = MockProperties.string,
        clientSecret = MockProperties.string,
        super(
          name: MockProperties.string,
          website: MockProperties.uri,
          vapid_key: MockProperties.string,
        );

  factory AuthenticatedApplication.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatedApplicationFromJson(json);
}
