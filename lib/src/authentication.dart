import 'package:web_socket_channel/web_socket_channel.dart';

import '../src/mock/mock_mastodon.dart' show MockAuthentication;

typedef WebSocketFactory = WebSocketChannel Function(Uri uri);

class Authentication implements MockAuthentication {
  final Uri baseUrl;
  final WebSocketFactory websocketFactory;

  Authentication(this.baseUrl, {this.websocketFactory});

  Uri get tokenUrl => baseUrl.replace(path: "/oauth/token");

  Uri get authorizationUrl => baseUrl.replace(path: "/oauth/authorize");

  String token;
}
