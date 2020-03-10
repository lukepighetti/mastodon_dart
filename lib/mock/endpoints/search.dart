import 'package:mastodon_dart/mastodon.dart';

class MockSearch {
  /// GET /api/v2/search
  /// https://docs.joinmastodon.org/api/rest/search/#get-api-v2-search
  Future<Results> search(String q, {bool resolve = false}) =>
      Future.value(Results.mock());
}
