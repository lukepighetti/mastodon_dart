import '../library.dart';

import '../../src/mock/endpoints/instances.dart';

mixin Instances on Authentication, Utilities implements MockInstances {
  /// GET /api/v1/instance
  ///
  /// - public
  /// - no scope specified
  Future<Instance> instance() async {
    final response = await request(
      Method.get,
      "/api/v1/instance",
    );

    return Instance.fromJson(json.decode(response.body));
  }
}
