import 'package:mastodon_dart/mastodon_dart.dart';

class MockInstances {
  /// GET /api/v1/instance
  /// https://docs.joinmastodon.org/api/rest/instances/#get-api-v1-instance
  Future<Instance> instance() => Future.value(Instance.mock());
}
