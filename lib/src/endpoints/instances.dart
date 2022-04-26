import 'dart:convert';

import '../authentication.dart';
import '../data/instance.dart';
import '../utilities.dart';

mixin Instances on Authentication, Utilities {
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
