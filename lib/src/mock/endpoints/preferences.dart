import 'package:mastodon_dart/mastodon_dart.dart';

class MockPreferences {
  /// GET /api/v1/preferences
  Future<UserPreferences> preferences() => Future.value(UserPreferences.mock());
}
