import '../library.dart';

import '../mock/endpoints/instances.dart';

mixin Instances on Authentication, Utilities implements MockInstances {
  /// GET /api/v1/instance
  ///
  /// - public
  /// - no scope specified
  ///
  /// https://docs.joinmastodon.org/api/rest/instances/#get-api-v1-instance
  Future<Instance> instance() async {
    final response = await request(
      Method.get,
      "/api/v1/instance",
    );

    return Instance.fromJson(json.decode(response.body));
  }
}
