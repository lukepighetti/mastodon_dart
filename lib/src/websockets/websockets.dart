import 'dart:convert';

import 'package:mastodon/src/authentication.dart';
import 'package:mastodon/src/data/notification.dart';
import 'package:mastodon/src/data/status.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

mixin Websockets on Authentication {
  Uri _channelUri(String stream, {String list, String tag}) => baseUrl.replace(
        scheme: "ws",
        path: "/api/v1/streaming",
        queryParameters: {
          "access_token": token,
          "stream": stream,
          "list": list,
          "tag": tag,
        }..removeWhere((_, value) => value == null),
      );

  /// https://docs.joinmastodon.org/api/streaming/#websocket
  ///
  /// authenticated
  ///
  /// returns Status (update), String (delete), Notification (notification), or null (filters_changed)
  Stream<dynamic> userStream() {
    final uri = _channelUri("user");

    final WebSocketChannel channel = IOWebSocketChannel.connect(uri);

    return channel.stream.map(_handleEvent);
  }

  /// https://docs.joinmastodon.org/api/streaming/#websocket
  ///
  /// public
  ///
  /// returns Status (update), String (delete), Notification (notification), or null (filters_changed)
  Stream<dynamic> publicTimelineStream({bool local = false}) {
    final uri = _channelUri(
      local ? "public:local" : "public",
    );

    final WebSocketChannel channel = IOWebSocketChannel.connect(uri);

    return channel.stream.map(_handleEvent);
  }

  /// https://docs.joinmastodon.org/api/streaming/#websocket
  ///
  /// public
  ///
  /// returns Status (update), String (delete), Notification (notification), or null (filters_changed)
  Stream<dynamic> hashtagTimelineStream(String tag, {bool local = false}) {
    final uri = _channelUri(
      local ? "hashtag:local" : "hashtag",
      tag: tag,
    );

    final WebSocketChannel channel = IOWebSocketChannel.connect(uri);

    return channel.stream.map(_handleEvent);
  }

  /// https://docs.joinmastodon.org/api/streaming/#websocket
  ///
  /// public
  ///
  /// returns Status (update), String (delete), Notification (notification), or null (filters_changed)
  Stream<dynamic> listStream(String id) {
    final uri = _channelUri("hashtag", list: id);

    final WebSocketChannel channel = IOWebSocketChannel.connect(uri);

    return channel.stream.map(_handleEvent);
  }

  /// https://docs.joinmastodon.org/api/streaming/#websocket
  ///
  /// public
  ///
  /// returns Status (update), String (delete), Notification (notification), or null (filters_changed)
  Stream<dynamic> directStream() {
    final uri = _channelUri("hashtag");

    final WebSocketChannel channel = IOWebSocketChannel.connect(uri);

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
