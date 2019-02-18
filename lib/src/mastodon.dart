import 'mixins/apps.dart';
import 'mixins/statuses.dart';
import 'mixins/timelines.dart';

class Mastodon = Authentication with Apps, Statuses, Timelines;

class Authentication {
  String key;
  Uri baseUrl;

  /// TODO: use constructor when Dart 2.1.1 lands
  /// see https://github.com/dart-lang/sdk/issues/35011
  ///
  /// Authentication(this.baseUrl);
}
