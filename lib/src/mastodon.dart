import 'mixins/apps.dart';

class Mastodon = Authentication with AppsMixin;

class Authentication {
  String key;
  Uri baseUrl;

  /// TODO: use constructor when Dart 2.1.1 lands
  /// see https://github.com/dart-lang/sdk/issues/35011
  ///
  /// Authentication(this.baseUrl);
}
