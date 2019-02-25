import '../library.dart';

import '../mock/mixins/instances.dart';

mixin Instances on Authentication implements MockInstancesMixin {
  /// GET /api/v1/instance
  ///
  /// - public
  /// - no scope specified
  ///
  /// https://docs.joinmastodon.org/api/rest/instances/#get-api-v1-instance
  Future<Instance> instance() async {
    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/instance",
    );

    final response = await get(
      uri,
    );

    return Instance.fromJson(json.decode(response.body));
  }
}
