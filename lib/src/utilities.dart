import 'package:http/http.dart';
import 'dart:convert';

import 'authentication.dart';
import 'exception.dart';

mixin Utilities on Authentication {
  Future<Response> request(
    Method method,
    String path, {
    bool authenticated = false,
    Map<String, dynamic> payload = const {},
    Map<String, String> headers = const {},
  }) async {
    final uri = baseUrl.replace(path: path);

    if (authenticated) {
      assert(key != null);

      headers.addAll({"Authorization": "Bearer $key"});
    }

    Response response;

    switch (method) {
      case Method.get:
        response = await get(
          uri.replace(
            queryParameters: payload,
          ),
          headers: headers,
        );
        break;

      case Method.post:
        response = await post(
          uri,
          body: payload,
          headers: headers,
        );
        break;

      case Method.put:
        response = await put(
          uri,
          body: payload,
          headers: headers,
        );
        break;

      case Method.patch:
        response = await patch(
          uri,
          body: payload,
          headers: headers,
        );
        break;

      case Method.delete:
        response = await delete(
          uri.replace(queryParameters: payload),
          headers: headers,
        );
        break;
    }

    if (response.statusCode < 200 || response.statusCode >= 300) {
      final body = Map.from(jsonDecode(response.body ?? "{}"));

      throw MastodonException(response.statusCode, body["error"] ?? "");
    }

    return response;
  }
}

enum Method { get, post, put, patch, delete }
