import '../../mock/endpoints/preferences.dart';
import '../library.dart';
import '../data/preferences.dart';

/// Preferred common behaviors to be shared across clients.
/// https://docs.joinmastodon.org/methods/accounts/preferences/
mixin Preferences on Authentication, Utilities implements MockPreferences{
  /// GET /api/v1/preferences
  ///
  /// token + read:accounts
  ///
  /// Types of response errors:
  /// - 401: Unauthorized (Incorrect Authorization header)
  Future<UserPreferences> preferences() async {
    final response = await request(
      Method.get,
      "/api/v1/preferences",
    );

    return UserPreferences.fromJson(json.decode(response.body));
  }
}