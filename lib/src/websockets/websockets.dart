import 'dart:convert';

import 'package:mastodon/src/authentication.dart';
import 'package:mastodon/src/data/notification.dart';
import 'package:mastodon/src/data/status.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

mixin Websockets on Authentication {
  WebSocketChannel _channel(String stream, {String list, String tag}) {
    assert(websocketFactory != null,
        "[Mastodon] We need a websocketFactory to create websockets!");

    final uri = baseUrl.replace(
      scheme: "ws",
      path: "/api/v1/streaming",
      queryParameters: {
        "access_token": token,
        "stream": stream,
        "list": list,
        "tag": tag,
      }..removeWhere((_, value) => value == null),
    );

    return websocketFactory(uri);
  }

  /// https://docs.joinmastodon.org/api/streaming/#websocket
  ///
  /// authenticated
  ///
  /// returns Status (update), String (delete), Notification (notification), or null (filters_changed)
  Stream<dynamic> userStream() {
    final channel = _channel("user");

    return channel.stream.map(_handleEvent);
  }

  /// https://docs.joinmastodon.org/api/streaming/#websocket
  ///
  /// public
  ///
  /// returns Status (update), String (delete), Notification (notification), or null (filters_changed)
  Stream<dynamic> publicTimelineStream({bool local = false}) {
    final channel = _channel(
      local ? "public:local" : "public",
    );

    return channel.stream.map(_handleEvent);
  }

  /// https://docs.joinmastodon.org/api/streaming/#websocket
  ///
  /// public
  ///
  /// returns Status (update), String (delete), Notification (notification), or null (filters_changed)
  Stream<dynamic> hashtagTimelineStream(String tag, {bool local = false}) {
    final channel = _channel(
      local ? "hashtag:local" : "hashtag",
      tag: tag,
    );

    return channel.stream.map(_handleEvent);
  }

  /// https://docs.joinmastodon.org/api/streaming/#websocket
  ///
  /// public
  ///
  /// returns Status (update), String (delete), Notification (notification), or null (filters_changed)
  Stream<dynamic> listStream(String id) {
    final channel = _channel("hashtag", list: id);

    return channel.stream.map(_handleEvent);
  }

  /// https://docs.joinmastodon.org/api/streaming/#websocket
  ///
  /// public
  ///
  /// returns Status (update), String (delete), Notification (notification), or null (filters_changed)
  Stream<dynamic> directStream() {
    final channel = _channel("direct");

    return channel.stream.map(_handleEvent);
  }

  /// Decode websocket events and serialize them appropriately.
  dynamic _handleEvent(dynamic data) {
    final response = Map.from(jsonDecode(data));

    final event = response["event"];

    if (event == "filters_changed") {
      /// payload is not defined
      return null;
    }

    final payload = jsonDecode(response["payload"]);

    switch (event) {
      case "update":
        return Status.fromJson(payload);

      case "delete":
        return payload.toString();

      case "notification":
        return Notification.fromJson(payload);
    }
  }
}
