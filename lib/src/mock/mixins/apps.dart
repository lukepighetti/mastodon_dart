import 'package:mastodon/mastodon.dart';

class MockAppsMixin {
  /// POST /api/v1/apps
  /// https://docs.joinmastodon.org/api/rest/apps/#post-api-v1-apps
  Future<AuthenticatedApplication> appCredentials(
    String clientName,
    String redirectUris,
    List<String> scopes,
    Uri website,
  ) =>
      Future.value(AuthenticatedApplication.mock());

  /// GET /api/v1/apps/verify_credentials
  /// https://docs.joinmastodon.org/api/rest/apps/#get-api-v1-apps-verify-credentials
  Future<Application> verifyAppCredentials() =>
      Future.value(Application.mock());
}
