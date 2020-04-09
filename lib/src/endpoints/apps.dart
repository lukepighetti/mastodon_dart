import '../library.dart';

import '../../src/mock/endpoints/apps.dart';

/// Register client applications that can be used to obtain OAuth tokens.
/// https://docs.joinmastodon.org/methods/apps/
mixin Apps on Authentication, Utilities implements MockApps {
  /// Create a new application to obtain OAuth2 credentials.
  ///
  /// POST /api/v1/apps
  ///
  /// Error response types:
  /// - 422: Unprocessable Entity (If a required parameter is missing or improperly formatted, the request will fail.)
  Future<AuthenticatedApplication> appCredentials(
    Uri website, [
    String redirectUris = "urn:ietf:wg:oauth:2.0:oob",
    String clientName = "mastodon-dart",
    List<String> scopes = const ["write", "read", "follow", "push"],
  ]) async {
    final response = await request(
      Method.post,
      "/api/v1/apps",
      payload: {
        "client_name": clientName,
        "redirect_uris": redirectUris,
        "scopes": scopes.join(" "),
        "website": website.toString(),
      },
    );

    return AuthenticatedApplication.fromJson(json.decode(response.body));
  }

  /// Confirm that the app's OAuth2 credentials work.
  ///
  /// GET /api/v1/apps/verify_credentials
  ///
  /// Error response types:
  /// - 401: Unauthorized (If the Authorization header contains an invalid token,
  /// is malformed, or is not present, an error will be returned indicating an authorization failure.)
  Future<Application> verifyAppCredentials() async {
    final response = await request(
      Method.post,
      "/api/v1/apps/verify_credentials",
      authenticated: true,
    );

    return Application.fromJson(json.decode(response.body));
  }
}
