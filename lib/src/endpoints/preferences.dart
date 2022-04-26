import 'dart:convert';

import '../authentication.dart';
import '../models/preferences.dart';
import '../utilities.dart';

/// Preferred common behaviors to be shared across clients.
/// https://docs.joinmastodon.org/methods/accounts/preferences/
mixin Preferences on Authentication, Utilities {
  /// GET /api/v1/preferences
  ///
  /// token + read:accounts
  Future<UserPreferences> preferences() async {
    final response = await request(
      Method.get,
      "/api/v1/preferences",
    );

    return UserPreferences.fromJson(json.decode(response.body));
  }
}
