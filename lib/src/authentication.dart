import 'package:web_socket_channel/web_socket_channel.dart';

typedef WebSocketFactory = WebSocketChannel Function(Uri uri);

class Authentication {
  /// The url for the Mastodon instance
  final Uri baseUrl;

  /// A (WebSocketChannel)[https://api.flutter.dev/flutter/dart-html/WebSocket-class.html] to receive data sent on a WebSocket
  final WebSocketFactory websocketFactory;

  Authentication(this.baseUrl, {required this.websocketFactory});

  /// Used to navigate the user to the token url for the given Mastodon instance
  Uri get tokenUrl => baseUrl.replace(path: "/oauth/token");

  /// /// Used to navigate the user to the authorization url for the given Mastodon instance
  Uri get authorizationUrl => baseUrl.replace(path: "/oauth/authorize");

  /// Authorization token
  String? token;
}
