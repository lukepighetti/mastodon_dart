import 'package:mastodon_dart/mastodon.dart';

class MockFilters {
  /// GET /api/v1/filters
  /// https://docs.joinmastodon.org/api/rest/filters/#get-api-v1-filters
  Future<List<Filter>> filters() =>
      Future.value(List.generate(5, (_) => Filter.mock()));

  /// POST /api/v1/filters
  /// https://docs.joinmastodon.org/api/rest/filters/#post-api-v1-filters
  Future<Filter> createFilter(
    String phrase,
    List<FilterContext> context, {
    bool irreversible,
    bool wholeWord,
    Duration expiresIn,
  }) =>
      Future.value(Filter.mock());

  /// GET /api/v1/filters/:id
  /// https://docs.joinmastodon.org/api/rest/filters/#get-api-v1-filters-id
  Future<Filter> filter(String id) => Future.value(Filter.mock());

  /// PUT /api/v1/filters/:id
  /// https://docs.joinmastodon.org/api/rest/filters/#put-api-v1-filters-id
  Future<Filter> updateFilter(
    String id,
    String phrase,
    List<FilterContext> context, {
    bool irreversible,
    bool wholeWord,
    Duration expiresIn,
  }) =>
      Future.value(Filter.mock());

  /// DELETE /api/v1/filters/:id
  /// https://docs.joinmastodon.org/api/rest/filters/#delete-api-v1-filters-id
  Future<dynamic> deleteFilter(String id) => Future.value(null);
}
