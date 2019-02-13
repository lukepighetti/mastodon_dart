import 'package:mastodon/mastodon.dart';
import 'package:meta/meta.dart';

class MockAppsMixin {
  /// POST /api/v1/apps
  /// https://docs.joinmastodon.org/api/rest/apps/#post-api-v1-apps
  Future<AuthenticatedApplication> authCredentials({
    @required String clientName,
    @required String redirectUris,
    @required List<String> scopes,
    @required Uri website,
  }) =>
      Future.value(AuthenticatedApplication.mock());

  /// GET /api/v1/apps/verify_credentials
  /// https://docs.joinmastodon.org/api/rest/apps/#get-api-v1-apps-verify-credentials
  Future<Application> verifyCredentials() => Future.value(Application.mock());
}
