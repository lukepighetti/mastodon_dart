import '../library.dart';

import '../mock/mixins/apps.dart';

mixin Apps on Authentication implements MockAppsMixin {
  /// POST /api/v1/apps
  /// https://docs.joinmastodon.org/api/rest/apps/#post-api-v1-apps
  Future<AuthenticatedApplication> appCredentials({
    String clientName = "mastodon-dart",
    String redirectUris = "urn:ietf:wg:oauth:2.0:oob",
    List<String> scopes = const ["write", "read", "follow", "push"],
    @required Uri website,
  }) async {
    final response = await post(
      "$baseUrl/api/v1/apps",
      body: {
        "client_name": clientName,
        "redirect_uris": redirectUris,
        "scopes": scopes.join(" "),
        "website": website.toString(),
      },
    );

    return AuthenticatedApplication.fromJson(json.decode(response.body));
  }

  /// GET /api/v1/apps/verify_credentials
  /// https://docs.joinmastodon.org/api/rest/apps/#get-api-v1-apps-verify-credentials
  Future<Application> verifyAppCredentials() async {
    assert(key != null);

    final response = await get(
      "$baseUrl/api/v1/apps/verify_credentials",
      headers: {"Authorization": "Bearer $key"},
    );

    return Application.fromJson(json.decode(response.body));
  }
}
