import 'dart:convert';

import '../authentication.dart';
import '../models/application.dart';
import '../utilities.dart';

/// Register client applications that can be used to obtain OAuth tokens.
/// https://docs.joinmastodon.org/methods/apps/
mixin Apps on Authentication, Utilities {
  /// Create a new application to obtain OAuth2 credentials.
  ///
  /// POST /api/v1/apps
  Future<AuthenticatedApplication> appCredentials({
    Uri? website,
    Uri? redirectUris,
    String clientName = "mastodon-dart",
    List<String> scopes = const ["write", "read", "push"],
  }) async {
    final response = await request(
      Method.post,
      "/api/v1/apps",
      payload: {
        "client_name": clientName,
        "redirect_uris": redirectUris == null
            ? "urn:ietf:wg:oauth:2.0:oob"
            : redirectUris.toString(),
        "scopes": scopes.join(" "),
        "website": website == null ? '' : website.toString(),
      },
    );

    return AuthenticatedApplication.fromJson(json.decode(response.body));
  }

  /// Confirm that the app's OAuth2 credentials work.
  ///
  /// GET /api/v1/apps/verify_credentials
  Future<Application> verifyAppCredentials() async {
    final response = await request(
      Method.post,
      "/api/v1/apps/verify_credentials",
      authenticated: true,
    );

    return Application.fromJson(json.decode(response.body));
  }
}
