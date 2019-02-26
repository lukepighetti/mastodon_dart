import 'mock/mock_mastodon.dart' show MockAuthentication;

class Authentication implements MockAuthentication {
  final Uri baseUrl;

  Authentication(this.baseUrl);

  Uri get tokenUrl => Uri(host: baseUrl.host, path: "/oauth/token");

  Uri get authorizationUrl => Uri(host: baseUrl.host, path: "/oauth/authorize");

  String key;
}
