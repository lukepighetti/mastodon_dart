# mastodon-dart

A Dart API for the Mastodon network. Work in progress.

[Mastodon data types](https://docs.joinmastodon.org/api/entities/)

[Mastodon endpoints](https://docs.joinmastodon.org/api/rest/accounts/)

Please wait until this API is more developed before contributing.

## Installation

```yaml
dependencies:
  mastodon:
    git: https://github.com/lukepighetti/mastodon-dart.git
```

## Mock Client

```dart
import 'package:mastodon/mastodon.dart';

main() async {
  final mock = MockMastodon();

  /// Hit the endpoints with blank parameters
  mock.account("").then((a) => print(
      [a, a.id, a.username, a.avatar, a.followersCount, a.followingCount]));

  /// Get mock data classes for building UIs
  /// [Instance of 'Account', 78056791, onegerbal4511, https://randomuser.me/api/portraits/men/64.jpg, 861, 34]
}
```

## Auth'd Client

```dart
import 'package:mastodon/mastodon.dart';

main() async {
  final mastodon = Mastodon()
    ..baseUrl = Uri.parse("https://mastodon.technology")
    ..key = "my_awesome_oauth2_key";

  final verify = await mastodon.verifyAppCredentials();

  print([verify.name, verify.website]);

  /// Our oauth2 key is correct! Lets make some real network calls.
  /// [oauth2_client_name, https://oauth2_website.com]
}
```
