import 'mock/mock_mastodon.dart' show MockAuthentication;

class Authentication implements MockAuthentication {
  final Uri baseUrl;

  Authentication(this.baseUrl);

  Uri get tokenUrl => baseUrl.replace(path: "/oauth/token");

  Uri get authorizationUrl => baseUrl.replace(path: "/oauth/authorize");

  String key;
}
