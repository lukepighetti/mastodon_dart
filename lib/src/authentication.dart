import 'mock/mock_mastodon.dart' show MockAuthentication;

class Authentication implements MockAuthentication {
  final Uri baseUrl;

  Authentication(this.baseUrl);

  Uri get tokenUrl =>
      Uri(scheme: baseUrl.scheme, host: baseUrl.host, path: "/oauth/token");

  Uri get authorizationUrl =>
      Uri(scheme: baseUrl.scheme, host: baseUrl.host, path: "/oauth/authorize");

  String key;
}
