import 'package:mastodon_dart/mastodon_dart.dart';

class MockBookmarks {
  /// GET /api/v1/bookmarks
  ///
  /// TODO: implement link headers for pagination
  /// shall we return prepopulated Futures for next/prev page?
  Future<List<Status>> bookmarks({int limit = 40}) =>
      Future.value(List.generate(limit, (_) => Status.mock()));

  /// POST /api/v1/statuses/:id/bookmark
  Future<Status> bookmark(String id) => Future.value(Status.mock());

  /// POST /api/v1/statuses/:id/unbookmark
  Future<Status> unbookmark(String id) => Future.value(Status.mock());
}
